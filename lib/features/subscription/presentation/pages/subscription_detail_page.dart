import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../domain/entities/subscription.dart';
import '../providers/subscription_provider.dart';
import '../widgets/payment_history_list.dart';

class SubscriptionDetailPage extends ConsumerWidget {
  final int subscriptionId;

  const SubscriptionDetailPage({super.key, required this.subscriptionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the stream so the page auto-updates after edit or confirm payment
    final subAsync = ref
        .watch(subscriptionsStreamProvider)
        .whenData(
          (list) => list.where((s) => s.id == subscriptionId).firstOrNull,
        );

    return subAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('Error: $e')),
      ),
      data: (sub) {
        if (sub == null) {
          // Subscription was deleted — pop back
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.canPop()) context.pop();
          });
          return const Scaffold(body: SizedBox.shrink());
        }
        return _DetailContent(subscription: sub);
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  MAIN CONTENT
// ══════════════════════════════════════════════════════════════════

class _DetailContent extends ConsumerWidget {
  final Subscription subscription;
  const _DetailContent({required this.subscription});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = subscription;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Collapsing header ──────────────────────────────────
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            actions: [
              // Edit button
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: l10n.actionEdit,
                onPressed: () => context.push('/subs/edit', extra: s),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                s.name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              background: _HeaderBackground(subscription: s),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Amount hero ──────────────────────────────────
                _AmountCard(subscription: s),
                const SizedBox(height: 20),

                // ── Info grid ────────────────────────────────────
                _InfoGrid(subscription: s),
                const SizedBox(height: 20),

                // ── Status + actions ─────────────────────────────
                _ActionsRow(subscription: s),
                const SizedBox(height: 28),

                // ── Notes ────────────────────────────────────────
                if (s.notes != null && s.notes!.isNotEmpty) ...[
                  _SectionTitle(l10n.subDetailNotes),
                  const SizedBox(height: 8),
                  _NotesCard(notes: s.notes!),
                  const SizedBox(height: 28),
                ],

                // ── Payment history ───────────────────────────────
                _SectionTitle(l10n.subDetailPaymentHistory),
                const SizedBox(height: 4),
                PaymentHistoryList(subscriptionId: s.id),
              ]),
            ),
          ),
        ],
      ),

      // ── FAB: confirm payment (only when due / overdue) ─────────
      floatingActionButton: (s.isActive && (s.isDueThisWeek || s.isOverdue))
          ? FloatingActionButton.extended(
              onPressed: () => ConfirmPaymentSheet.show(
                context,
                subscriptionId: s.id,
                subscriptionName: s.name,
                amount: s.amount,
                currency: s.currency,
              ),
              icon: const Icon(Icons.check_rounded),
              label: Text(l10n.subDetailConfirmPayment),
            )
          : null,
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  HEADER BACKGROUND
// ══════════════════════════════════════════════════════════════════

class _HeaderBackground extends StatelessWidget {
  final Subscription subscription;
  const _HeaderBackground({required this.subscription});

  Color get _accent {
    final hex = subscription.colorHex;
    if (hex == null) return Colors.indigo;
    try {
      return Color(int.parse('FF${hex.replaceAll('#', '')}', radix: 16));
    } catch (_) {
      return Colors.indigo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _accent.withValues(alpha: 0.8),
            _accent.withValues(alpha: 0.4),
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: CircleAvatar(
          radius: 36,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          child: Text(
            subscription.name.isNotEmpty
                ? subscription.name[0].toUpperCase()
                : '?',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  AMOUNT CARD
// ══════════════════════════════════════════════════════════════════

class _AmountCard extends StatelessWidget {
  final Subscription subscription;
  const _AmountCard({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final s = subscription;

    final nextDate = s.nextBillingDate;
    final dateStr =
        '${nextDate.day.toString().padLeft(2, '0')}/${nextDate.month.toString().padLeft(2, '0')}/${nextDate.year}';

    final (dueLabel, dueColor) = switch (true) {
      _ when s.isOverdue => (
        l10n.subDetailOverdue(s.daysUntilBilling.abs()),
        theme.colorScheme.error,
      ),
      _ when s.isDueToday => (
        l10n.subDetailDueToday,
        theme.colorScheme.tertiary,
      ),
      _ when s.isDueThisWeek => (
        l10n.subDetailDueInDays(s.daysUntilBilling),
        theme.colorScheme.primary,
      ),
      _ => (
        l10n.subDetailDueInDaysPlain(s.daysUntilBilling),
        theme.colorScheme.onSurface.withValues(alpha: 0.5),
      ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            CurrencyFormatter.format(s.amount, s.currency),
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.subDetailPer(s.billingCycle.name),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: dueColor),
              const SizedBox(width: 5),
              Text(
                '$dueLabel · $dateStr',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: dueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  INFO GRID
// ══════════════════════════════════════════════════════════════════

class _InfoGrid extends StatelessWidget {
  final Subscription subscription;
  const _InfoGrid({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final s = subscription;
    final l10n = AppLocalizations.of(context)!;
    final startDate =
        '${s.startDate.day.toString().padLeft(2, '0')}/${s.startDate.month.toString().padLeft(2, '0')}/${s.startDate.year}';

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.4,
      children: [
        _InfoTile(
          label: l10n.subDetailCategory,
          value: s.category,
          icon: Icons.grid_view_rounded,
        ),
        _InfoTile(
          label: l10n.subDetailBilling,
          value:
              s.billingCycle.name[0].toUpperCase() +
              s.billingCycle.name.substring(1),
          icon: Icons.repeat_rounded,
        ),
        _InfoTile(
          label: l10n.subDetailStarted,
          value: startDate,
          icon: Icons.flag_outlined,
        ),
        _InfoTile(
          label: l10n.subDetailStatus,
          value: s.status.name[0].toUpperCase() + s.status.name.substring(1),
          icon: Icons.circle_outlined,
        ),
        _InfoTile(
          label: l10n.subDetailMonthlyCost,
          value: CurrencyFormatter.format(s.monthlyCost, s.currency),
          icon: Icons.trending_up_rounded,
        ),
        _InfoTile(
          label: l10n.subDetailYearlyCost,
          value: CurrencyFormatter.format(s.monthlyCost * 12, s.currency),
          icon: Icons.savings_outlined,
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 12,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  ACTIONS ROW  (pause, reminder)
// ══════════════════════════════════════════════════════════════════

class _ActionsRow extends ConsumerWidget {
  final Subscription subscription;
  const _ActionsRow({required this.subscription});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = subscription;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        // Pause / Resume
        Expanded(
          child: OutlinedButton.icon(
            icon: Icon(
              s.isActive
                  ? Icons.pause_circle_outline
                  : Icons.play_circle_outline,
            ),
            label: Text(
              s.isActive ? l10n.subDetailPause : l10n.subDetailResume,
            ),
            onPressed: () {
              final newStatus = s.isActive
                  ? SubscriptionStatus.paused
                  : SubscriptionStatus.active;
              ref
                  .read(subscriptionNotifierProvider.notifier)
                  .update(s.copyWith(status: newStatus));
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: s.isActive
                  ? theme.colorScheme.secondary
                  : theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Reminder settings
        Expanded(
          child: OutlinedButton.icon(
            icon: const Icon(Icons.notifications_outlined),
            label: Text(l10n.subDetailReminders),
            onPressed: () =>
                context.push('/subscriptions/${s.id}/reminders', extra: s.name),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  NOTES CARD
// ══════════════════════════════════════════════════════════════════

class _NotesCard extends StatelessWidget {
  final String notes;
  const _NotesCard({required this.notes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: Text(notes, style: theme.textTheme.bodyMedium),
    );
  }
}

// ── Section title ──────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
