import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/subscription.dart';
import '../../domain/models/add_subscription_params.dart';
import '../providers/subscription_provider.dart';
import '../../../../core/utils/currency_formatter.dart';

class SubscriptionFormPage extends ConsumerStatefulWidget {
  final Subscription? existing; // null = add mode, non-null = edit mode

  const SubscriptionFormPage({super.key, this.existing});

  @override
  ConsumerState<SubscriptionFormPage> createState() =>
      _SubscriptionFormPageState();
}

class _SubscriptionFormPageState extends ConsumerState<SubscriptionFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _amountCtrl;
  late final TextEditingController _notesCtrl;

  String _currency = 'IDR';
  String _category = 'Entertainment';
  BillingCycle _billingCycle = BillingCycle.monthly;
  int _billingDay = 1;
  DateTime _startDate = DateTime.now();

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    _nameCtrl = TextEditingController(text: e?.name ?? '');
    // Pre-fill amount formatted (e.g. "350.000") in edit mode
    _amountCtrl = TextEditingController(
      text: e != null
          ? CurrencyFormatter.formatAmount(e.amount, e.currency)
          : '',
    );
    _notesCtrl = TextEditingController(text: e?.notes ?? '');

    if (e != null) {
      _currency = e.currency;
      _category = e.category;
      _billingCycle = e.billingCycle;
      _billingDay = e.billingDay;
      _startDate = e.startDate;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _amountCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(subscriptionNotifierProvider.notifier);

    if (_isEdit) {
      await notifier.update(
        widget.existing!.copyWith(
          name: _nameCtrl.text.trim(),
          category: _category,
          amount: CurrencyFormatter.parse(_amountCtrl.text, _currency) ?? 0,
          currency: _currency,
          billingCycle: _billingCycle,
          billingDay: _billingDay,
          startDate: _startDate,
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
        ),
      );
    } else {
      await notifier.add(
        AddSubscriptionParams(
          name: _nameCtrl.text.trim(),
          category: _category,
          amount: CurrencyFormatter.parse(_amountCtrl.text, _currency) ?? 0,
          currency: _currency,
          billingCycle: _billingCycle,
          billingDay: _billingDay,
          startDate: _startDate,
          notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
        ),
      );
    }

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLoading = ref.watch(subscriptionNotifierProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? l10n.subFormEditTitle : l10n.subFormAddTitle),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Name
            TextFormField(
              controller: _nameCtrl,
              decoration: InputDecoration(labelText: l10n.subFormNameLabel),
              textCapitalization: TextCapitalization.words,
              validator: (v) =>
                  (v == null || v.trim().isEmpty)
                      ? l10n.subFormNameRequired
                      : null,
            ),
            const SizedBox(height: 16),

            // Amount + Currency row
            Row(
              children: [
                Expanded(
                  // amount field
                  flex: 3,
                  child: TextFormField(
                    controller: _amountCtrl,
                    decoration: InputDecoration(
                      labelText: l10n.subFormAmountLabel,
                      prefixText: '${CurrencyFormatter.symbol(_currency)} ',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      ThousandsSeparatorInputFormatter(currency: _currency),
                    ],
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return l10n.subFormAmountRequired;
                      }
                      final parsed = CurrencyFormatter.parse(v, _currency);
                      if (parsed == null) return l10n.subFormAmountInvalid;
                      if (parsed <= 0) return l10n.subFormAmountPositive;
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  // currency field
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    initialValue: _currency,
                    decoration:
                        InputDecoration(labelText: l10n.subFormCurrencyLabel),
                    items: ['IDR']
                        .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        _currency = v!;
                        // Reformat existing amount for new currency
                        final current = CurrencyFormatter.parse(
                          _amountCtrl.text,
                          _currency,
                        );
                        if (current != null && current > 0) {
                          _amountCtrl.text = CurrencyFormatter.formatAmount(
                            current,
                            v,
                          );
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Category
            DropdownButtonFormField<String>(
              initialValue: _category,
              decoration:
                  InputDecoration(labelText: l10n.subFormCategoryLabel),
              items: [
                'Entertainment',
                'Productivity',
                'Utilities',
                'Health',
                'Finance',
                'Education',
                'Other',
              ].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),
            const SizedBox(height: 16),

            // Billing cycle
            DropdownButtonFormField<BillingCycle>(
              initialValue: _billingCycle,
              decoration:
                  InputDecoration(labelText: l10n.subFormBillingCycleLabel),
              items: BillingCycle.values
                  .map(
                    (c) => DropdownMenuItem(
                      value: c,
                      child: Text(
                        c.name[0].toUpperCase() + c.name.substring(1),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _billingCycle = v!),
            ),
            const SizedBox(height: 16),

            // Billing day
            TextFormField(
              initialValue: _billingDay.toString(),
              decoration: InputDecoration(
                labelText: l10n.subFormBillingDayLabel,
                helperText: l10n.subFormBillingDayHelper,
              ),
              keyboardType: TextInputType.number,
              onChanged: (v) => _billingDay = int.tryParse(v) ?? 1,
              validator: (v) {
                final n = int.tryParse(v ?? '');
                if (n == null || n < 1 || n > 28) {
                  return l10n.subFormBillingDayRange;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Start date picker
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.subFormStartDateLabel),
              subtitle: Text(
                '${_startDate.day}/${_startDate.month}/${_startDate.year}',
              ),
              trailing: const Icon(Icons.calendar_today_outlined),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _startDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => _startDate = picked);
              },
            ),
            const Divider(),
            const SizedBox(height: 8),

            // Notes
            TextFormField(
              controller: _notesCtrl,
              decoration: InputDecoration(
                labelText: l10n.subFormNotesLabel,
                alignLabelWithHint: true,
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),

            // Submit
            FilledButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      _isEdit ? l10n.subFormSaveButton : l10n.subFormAddButton,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
