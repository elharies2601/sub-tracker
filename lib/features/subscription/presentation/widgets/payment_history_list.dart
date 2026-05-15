import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/currency_formatter.dart';
import '../../../../core/ads/ads_provider.dart';
import 'package:startapp_sdk/startapp.dart';
import '../../domain/entities/payment_history.dart';
import '../providers/payment_history_provider.dart';

/// Displays payment history for a single subscription.
/// Can be embedded in a detail page or used standalone.
class PaymentHistoryList extends ConsumerWidget {
  final int subscriptionId;

  const PaymentHistoryList({super.key, required this.subscriptionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(
      paymentHistoryForSubscriptionProvider(subscriptionId),
    );

    return switch (historyAsync) {
      AsyncLoading() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      ),
      AsyncError(:final error) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          'Error: $error',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
      AsyncData(:final value) =>
        value.isEmpty ? _EmptyHistory() : _HistoryContent(payments: value),
      _ => const SizedBox.shrink(),
    };
  }
}

// ── Empty state ────────────────────────────────────────────────────

class _EmptyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 40,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.2),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.paymentNoHistory,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Content — grouped by month ─────────────────────────────────────

class _HistoryContent extends StatelessWidget {
  final List<PaymentHistory> payments;
  const _HistoryContent({required this.payments});

  @override
  Widget build(BuildContext context) {
    // Group by "monthLabel" e.g. "Apr 2026"
    final grouped = <String, List<PaymentHistory>>{};
    for (final p in payments) {
      (grouped[p.monthLabel] ??= []).add(p);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: grouped.entries.map((entry) {
        final monthTotal = entry.value.fold(0.0, (sum, p) => sum + p.amount);
        final currency = entry.value.first.currency;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month header
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    CurrencyFormatter.format(monthTotal, currency),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            // Payment rows
            ...entry.value.map((p) => _PaymentTile(payment: p)),
          ],
        );
      }).toList(),
    );
  }
}

// ── Single payment tile ────────────────────────────────────────────

class _PaymentTile extends StatelessWidget {
  final PaymentHistory payment;
  const _PaymentTile({required this.payment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final date = payment.paidAt;
    final dateStr =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        children: [
          // Calendar icon
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          // Date + notes
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateStr, style: theme.textTheme.bodyMedium),
                if (payment.notes != null && payment.notes!.isNotEmpty)
                  Text(
                    payment.notes!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.45,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Amount
          Text(
            CurrencyFormatter.format(payment.amount, payment.currency),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  CONFIRM PAYMENT BOTTOM SHEET
//  Call via: ConfirmPaymentSheet.show(context, subscriptionId: id)
// ══════════════════════════════════════════════════════════════════

class ConfirmPaymentSheet extends ConsumerStatefulWidget {
  final int subscriptionId;
  final String subscriptionName;
  final double amount;
  final String currency;

  const ConfirmPaymentSheet({
    super.key,
    required this.subscriptionId,
    required this.subscriptionName,
    required this.amount,
    required this.currency,
  });

  static Future<bool> show(
    BuildContext context, {
    required int subscriptionId,
    required String subscriptionName,
    required double amount,
    required String currency,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (sheetCtx) => ConfirmPaymentSheet(
        subscriptionId: subscriptionId,
        subscriptionName: subscriptionName,
        amount: amount,
        currency: currency,
      ),
    );
    return result ?? false;
  }

  @override
  ConsumerState<ConfirmPaymentSheet> createState() =>
      _ConfirmPaymentSheetState();
}

class _ConfirmPaymentSheetState extends ConsumerState<ConfirmPaymentSheet> {
  final _notesCtrl = TextEditingController();

  @override
  void dispose() {
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _confirm(BuildContext sheetCtx) async {
    final success = await ref
        .read(paymentHistoryProvider.notifier)
        .recordPayment(
          widget.subscriptionId,
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
        );
        
    if (success && ref.read(shouldShowAdsProvider)) {
      try {
        final startAppSdk = StartAppSdk();
        final interstitial = await startAppSdk.loadInterstitialAd();
        await interstitial.show();
      } catch (_) {
        // Ignore ad errors so we don't block the UI
      }
    }

    if (mounted) Navigator.of(sheetCtx).pop(success);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isLoading = ref.watch(paymentHistoryProvider).isLoading;

    return Padding(
      // Push sheet up above keyboard
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Text(
                l10n.paymentConfirmTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.subscriptionName,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),

              const SizedBox(height: 20),

              // Amount display
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(
                    alpha: 0.4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      l10n.paymentAmountPaid,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      CurrencyFormatter.format(widget.amount, widget.currency),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Optional notes
              TextField(
                controller: _notesCtrl,
                decoration: InputDecoration(
                  labelText: l10n.paymentNotesLabel,
                  hintText: l10n.paymentNotesHint,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
                textCapitalization: TextCapitalization.sentences,
                maxLines: 2,
              ),

              const SizedBox(height: 20),

              // Confirm button
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: isLoading ? null : () => _confirm(context),
                  icon: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.check_rounded),
                  label: Text(
                    isLoading ? l10n.paymentSaving : l10n.paymentConfirmButton,
                  ),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
