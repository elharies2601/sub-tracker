import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/core/ads/banner_ad_widget.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/subscription.dart';
import '../providers/payment_history_provider.dart';
import '../providers/subscription_provider.dart';
import '../widgets/subscription_card.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/ads/ads_provider.dart';

class SubscriptionListPage extends ConsumerWidget {
  const SubscriptionListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final subscriptions = ref.watch(subscriptionsStreamProvider);
    final billingSummary = ref.watch(billingSummaryProvider);
    final upcoming = ref.watch(upcomingBillsProvider);
    final showAds = ref.watch(shouldShowAdsProvider);

    // Listen to notifier errors and show SnackBar
    ref.listen<AsyncValue<void>>(subscriptionProvider, (_, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.subListTitle)),
      bottomNavigationBar: showAds ? SafeArea(child: BannerAdWidget()) : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/subscriptions/add'),
        icon: const Icon(Icons.add),
        label: Text(l10n.subListAddLabel),
      ),
      body: CustomScrollView(
        slivers: [
          // ── Summary header ──────────────────────────────────────
          SliverToBoxAdapter(
            child: _SummaryHeader(
              billingSummary: billingSummary,
              upcoming: upcoming,
            ),
          ),

          // ── List ────────────────────────────────────────────────
          subscriptions.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) =>
                SliverFillRemaining(child: Center(child: Text('Error: $e'))),
            data: (list) {
              if (list.isEmpty) {
                return const SliverFillRemaining(child: _EmptyState());
              }
              return SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                sliver: SliverList.builder(
                  itemCount: list.length,
                  itemBuilder: (ctx, i) {
                    final sub = list[i];
                    return SubscriptionCard(
                      subscription: sub,
                      onTap: () => context.push('/subscriptions/${sub.id}'),
                      onDelete: () => {
                        ref
                            .read(paymentHistoryProvider.notifier)
                            .deletePayment(subscriptionId: sub.id),
                        ref
                            .read(subscriptionProvider.notifier)
                            .delete(sub.id),
                      },
                      onEdit: () => context.push('/subs/edit', extra: sub),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ── Summary header widget ──────────────────────────────────────────

class _SummaryHeader extends StatelessWidget {
  final AsyncValue<List<CycleSummary>> billingSummary;
  final AsyncValue<List<Subscription>> upcoming;

  const _SummaryHeader({required this.billingSummary, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pengeluaran aktif',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 10),

          // ── Per-cycle rows ─────────────────────────────────────
          billingSummary.when(
            loading: () => const CircularProgressIndicator.adaptive(),
            error: (_, __) => const Text('—'),
            data: (cycles) {
              if (cycles.isEmpty) {
                return Text(
                  'Belum ada langganan aktif',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(
                      0.6,
                    ),
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: cycles.map((c) => _CycleRow(cycle: c)).toList(),
              );
            },
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, thickness: 0.5),
          const SizedBox(height: 12),

          // ── Upcoming bills ─────────────────────────────────────
          upcoming.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (list) => Row(
              children: [
                Icon(
                  list.isEmpty
                      ? Icons.check_circle_outline
                      : Icons.notifications_active_outlined,
                  size: 14,
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.6),
                ),
                const SizedBox(width: 6),
                Text(
                  list.isEmpty
                      ? 'Tidak ada tagihan minggu ini'
                      : '${list.length} tagihan jatuh tempo minggu ini',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimaryContainer.withOpacity(
                      0.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleRow extends StatelessWidget {
  final CycleSummary cycle;
  const _CycleRow({required this.cycle});

  static const _cycleIcon = {
    'weekly': Icons.repeat_rounded,
    'monthly': Icons.calendar_month_rounded,
    'yearly': Icons.calendar_today_rounded,
  };

  static const _cycleLabel = {
    'weekly': 'minggu',
    'monthly': 'bulan',
    'yearly': 'tahun',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = _cycleIcon[cycle.cycleLabel] ?? Icons.repeat_rounded;
    final label = _cycleLabel[cycle.cycleLabel] ?? cycle.cycleLabel;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(
            icon,
            size: 14,
            color: theme.colorScheme.onPrimaryContainer.withOpacity(0.55),
          ),
          const SizedBox(width: 6),
          Text(
            CurrencyFormatter.format(cycle.total, cycle.currency),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '/ $label',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.55),
            ),
          ),
          const Spacer(),
          // Subscription count badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '${cycle.count} langganan',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.subscriptions_outlined, size: 64, color: Colors.grey),
        const SizedBox(height: 16),
        Text(l10n.subListEmpty, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Text(
          l10n.subListEmptyHint,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }
}
