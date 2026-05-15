import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../core/ads/ads_provider.dart';
import '../../../core/ads/banner_ad_widget.dart';
import '../domain/models/spending_summary.dart';
import '../../subscription/domain/entities/subscription.dart';
import './providers/dashboard_provider.dart';
import '../../subscription/presentation/providers/subscription_provider.dart';
import './widgets/monthly_bar_chart.dart';
import './widgets/spending_donut_chart.dart';
import './widgets/stat_card.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final upcomingAsync = ref.watch(upcomingBillsProvider);
    final showAds = ref.watch(shouldShowAdsProvider);

    return Scaffold(
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (summary) => summary.isEmpty
            ? const _EmptyDashboard()
            : _DashboardContent(summary: summary, upcomingAsync: upcomingAsync),
      ),
      bottomNavigationBar: showAds ? const SafeArea(child: BannerAdWidget()) : null,
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  MAIN CONTENT
// ══════════════════════════════════════════════════════════════════

class _DashboardContent extends StatelessWidget {
  final SpendingSummary summary;
  final AsyncValue<List<Subscription>> upcomingAsync;

  const _DashboardContent({required this.summary, required this.upcomingAsync});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        // ── App bar ──────────────────────────────────────────────
        SliverAppBar(
          title: Text(l10n.dashboardTitle),
          pinned: true,
          centerTitle: false,
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // ── Summary stat cards ─────────────────────────────
              _SummaryCards(summary: summary),
              const SizedBox(height: 28),

              // ── Spending by category ───────────────────────────
              if (summary.byCategory.isNotEmpty) ...[
                _SectionHeader(
                  title: l10n.dashboardSpendingByCategory,
                  subtitle: l10n.dashboardMonthlyBreakdown,
                ),
                const SizedBox(height: 16),
                SpendingDonutChart(
                  categories: summary.byCategory,
                  totalMonthly: summary.monthlyTotal,
                  currency: summary.currency,
                ),
                const SizedBox(height: 28),
              ],

              // ── Monthly trend ──────────────────────────────────
              _SectionHeader(
                title: l10n.dashboardMonthlyTrend,
                subtitle: l10n.dashboardLast6Months,
              ),
              const SizedBox(height: 16),
              MonthlyBarChart(
                months: summary.last6Months,
                currency: summary.currency,
              ),
              const SizedBox(height: 28),

              // ── Upcoming bills ─────────────────────────────────
              _SectionHeader(
                title: l10n.dashboardUpcomingThisWeek,
                subtitle: l10n.dashboardNext7Days,
              ),
              const SizedBox(height: 12),
              _UpcomingBills(upcomingAsync: upcomingAsync),
            ]),
          ),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  SUMMARY CARDS ROW
// ══════════════════════════════════════════════════════════════════

class _SummaryCards extends StatelessWidget {
  final SpendingSummary summary;
  const _SummaryCards({required this.summary});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // Monthly total — full width hero card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.dashboardMonthlySpend,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                CurrencyFormatter.format(
                  summary.monthlyTotal,
                  summary.currency,
                ),
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.dashboardPerYear(
                  CurrencyFormatter.format(
                    summary.yearlyTotal,
                    summary.currency,
                  ),
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onPrimaryContainer.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Secondary stats row
        Row(
          children: [
            Expanded(
              child: StatCard(
                label: l10n.dashboardStatActive,
                value: '${summary.activeCount}',
                subtitle: l10n.dashboardStatSubscriptions,
                icon: Icons.check_circle_outline,
                accentColor: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StatCard(
                label: l10n.dashboardStatPaused,
                value: '${summary.pausedCount}',
                subtitle: l10n.dashboardStatSubscriptions,
                icon: Icons.pause_circle_outline,
                accentColor: theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: StatCard(
                label: l10n.dashboardStatCategories,
                value: '${summary.byCategory.length}',
                subtitle: summary.topCategory?.category,
                icon: Icons.grid_view_rounded,
                accentColor: theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  UPCOMING BILLS
// ══════════════════════════════════════════════════════════════════

class _UpcomingBills extends StatelessWidget {
  final AsyncValue<List<Subscription>> upcomingAsync;
  const _UpcomingBills({required this.upcomingAsync});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return upcomingAsync.when(
      loading: () => const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox.shrink(),
      data: (list) {
        if (list.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              l10n.dashboardNoBillsNext7Days,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withOpacity(0.45),
              ),
            ),
          );
        }
        return Column(
          children: list.map((s) => _UpcomingTile(subscription: s)).toList(),
        );
      },
    );
  }
}

class _UpcomingTile extends StatelessWidget {
  final Subscription subscription;
  const _UpcomingTile({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final s = subscription;
    final daysLeft = s.daysUntilBilling;

    final (badgeText, badgeColor) = switch (daysLeft) {
      0 => (l10n.dashboardBadgeToday, theme.colorScheme.error),
      1 => (l10n.dashboardBadgeTomorrow, theme.colorScheme.tertiary),
      _ => (l10n.dashboardBadgeDays(daysLeft), theme.colorScheme.secondary),
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: daysLeft == 0
              ? theme.colorScheme.error.withValues(alpha: 0.3)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          // Initial avatar
          CircleAvatar(
            radius: 18,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              s.name.isNotEmpty ? s.name[0].toUpperCase() : '?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimaryContainer,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  CurrencyFormatter.format(s.amount, s.currency),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badgeText,
              style: theme.textTheme.labelSmall?.copyWith(
                color: badgeColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  HELPERS
// ══════════════════════════════════════════════════════════════════

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  const _SectionHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(width: 8),
          Text(
            subtitle!,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
            ),
          ),
        ],
      ],
    );
  }
}

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart_rounded,
            size: 72,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.dashboardEmpty,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.dashboardEmptyHint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
