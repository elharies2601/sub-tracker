import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';

import '../../domain/entities/subscription.dart';
import '../../../../core/utils/currency_formatter.dart';

class SubscriptionCard extends StatelessWidget {
  final Subscription subscription;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const SubscriptionCard({
    super.key,
    required this.subscription,
    required this.onTap,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final s = subscription;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Color dot / icon
              _ColorDot(colorHex: s.colorHex, name: s.name),
              const SizedBox(width: 12),

              // Main info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${CurrencyFormatter.format(s.amount, s.currency)} / ${s.billingCycle.name}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Due badge + actions
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _DueBadge(subscription: s),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Edit
                      IconButton(
                        tooltip: l10n.actionEdit,
                        icon: const Icon(Icons.edit_outlined, size: 20),
                        onPressed: onEdit,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      // Delete
                      IconButton(
                        tooltip: l10n.actionDelete,
                        icon: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: theme.colorScheme.error.withValues(alpha: 0.7),
                        ),
                        onPressed: () => _confirmDelete(context),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.cardDeleteTitle),
        content: Text(l10n.cardDeleteContent(subscription.name)),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
              onDelete();
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(l10n.actionDelete),
          ),
        ],
      ),
    );
  }
}

// ── Color dot avatar ───────────────────────────────────────────────

class _ColorDot extends StatelessWidget {
  final String? colorHex;
  final String name;

  const _ColorDot({this.colorHex, required this.name});

  Color get _color {
    if (colorHex == null) return Colors.blueGrey;
    try {
      return Color(int.parse('FF${colorHex!.replaceAll('#', '')}', radix: 16));
    } catch (_) {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: _color.withOpacity(0.2),
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: TextStyle(color: _color, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ── Due badge ──────────────────────────────────────────────────────

class _DueBadge extends StatelessWidget {
  final Subscription subscription;
  const _DueBadge({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final s = subscription;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final (label, bg, fg) = switch (true) {
      _ when s.isOverdue => (
        l10n.cardBadgeOverdue,
        theme.colorScheme.errorContainer,
        theme.colorScheme.onErrorContainer,
      ),
      _ when s.isDueToday => (
        l10n.cardBadgeDueToday,
        theme.colorScheme.tertiaryContainer,
        theme.colorScheme.onTertiaryContainer,
      ),
      _ when s.isDueThisWeek => (
        '${s.daysUntilBilling}d',
        theme.colorScheme.secondaryContainer,
        theme.colorScheme.onSecondaryContainer,
      ),
      _ => (
        '${s.daysUntilBilling}d',
        Colors.transparent,
        theme.colorScheme.outline,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: bg == Colors.transparent
            ? Border.all(color: theme.colorScheme.outline.withOpacity(0.4))
            : null,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}
