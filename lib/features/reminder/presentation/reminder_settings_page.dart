import 'package:flutter/material.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reminder_provider.dart';

class ReminderSettingsPage extends ConsumerStatefulWidget {
  final int subscriptionId;
  final String subscriptionName;

  const ReminderSettingsPage({
    super.key,
    required this.subscriptionId,
    required this.subscriptionName,
  });

  @override
  ConsumerState<ReminderSettingsPage> createState() =>
      _ReminderSettingsPageState();
}

class _ReminderSettingsPageState extends ConsumerState<ReminderSettingsPage> {
  // Default reminder offsets
  final Set<int> _selectedDays = {7, 3, 1, 0};
  TimeOfDay _remindTime = const TimeOfDay(hour: 9, minute: 0);

  @override
  void initState() {
    super.initState();
    // Load existing reminders into state after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadExisting());
  }

  Future<void> _loadExisting() async {
    final reminders = await ref.read(
      remindersForSubscriptionProvider(widget.subscriptionId).future,
    );
    if (reminders.isNotEmpty) {
      setState(() {
        _selectedDays
          ..clear()
          ..addAll(reminders.map((r) => r.daysBefore));
        _remindTime = reminders.first.remindTime;
      });
    }
  }

  Future<void> _pickTime() async {
    final l10n = AppLocalizations.of(context)!;
    final picked = await showTimePicker(
      context: context,
      initialTime: _remindTime,
      helpText: l10n.reminderSelectTime,
    );
    if (picked != null) setState(() => _remindTime = picked);
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.reminderSaveAtLeastOne)),
      );
      return;
    }

    await ref
        .read(reminderProvider.notifier)
        .saveReminders(
          subscriptionId: widget.subscriptionId,
          daysBefore: _selectedDays.toList(),
          remindTime: _remindTime,
        );

    if (mounted) {
      final state = ref.read(reminderProvider);
      if (state is AsyncData) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.reminderSaved)));
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isLoading = ref.watch(reminderProvider).isLoading;
    final theme = Theme.of(context);

    // Build offset options using localized strings
    final offsetOptions = [
      _OffsetOption(7, l10n.reminder7DaysBefore, l10n.reminder7DaysSubtitle),
      _OffsetOption(3, l10n.reminder3DaysBefore, l10n.reminder3DaysSubtitle),
      _OffsetOption(1, l10n.reminder1DayBefore, l10n.reminder1DaySubtitle),
      _OffsetOption(0, l10n.reminderOnTheDay, l10n.reminderOnTheDaySubtitle),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.reminderAppBarTitle(widget.subscriptionName)),
        actions: [
          TextButton(
            onPressed: isLoading ? null : _save,
            child: isLoading
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.actionSave),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Notify me section ────────────────────────────────────
          Text(
            l10n.reminderNotifyBefore,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          ...offsetOptions.map(
            (opt) => _DayToggleTile(
              label: opt.label,
              subtitle: opt.subtitle,
              daysBefore: opt.days,
              isSelected: _selectedDays.contains(opt.days),
              onToggle: (selected) => setState(() {
                if (selected) {
                  _selectedDays.add(opt.days);
                } else {
                  _selectedDays.remove(opt.days);
                }
              }),
            ),
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // ── Reminder time ────────────────────────────────────────
          Text(
            l10n.reminderRemindAt,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.access_time_outlined),
            title: Text(
              _remindTime.format(context),
              style: theme.textTheme.bodyLarge,
            ),
            subtitle: Text(l10n.reminderTapToChange),
            onTap: _pickTime,
          ),

          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 16),

          // ── Info box ─────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 18,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l10n.reminderInfoText,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // ── Disable all ──────────────────────────────────────────
          OutlinedButton.icon(
            icon: const Icon(Icons.notifications_off_outlined),
            label: Text(l10n.reminderDisableAll),
            style: OutlinedButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
              side: BorderSide(color: theme.colorScheme.error.withOpacity(0.4)),
            ),
            onPressed: () async {
              setState(() => _selectedDays.clear());
              await ref
                  .read(reminderProvider.notifier)
                  .cancelForSubscription(widget.subscriptionId);
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.reminderAllDisabled)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// ── Offset option model ────────────────────────────────────────────

class _OffsetOption {
  final int days;
  final String label;
  final String subtitle;
  const _OffsetOption(this.days, this.label, this.subtitle);
}

// ── Day toggle tile ────────────────────────────────────────────────

class _DayToggleTile extends StatelessWidget {
  final String label;
  final String subtitle;
  final int daysBefore;
  final bool isSelected;
  final ValueChanged<bool> onToggle;

  const _DayToggleTile({
    required this.label,
    required this.subtitle,
    required this.daysBefore,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.outlineVariant,
          width: isSelected ? 1.5 : 0.5,
        ),
        color: isSelected
            ? theme.colorScheme.primaryContainer.withOpacity(0.3)
            : null,
      ),
      child: CheckboxListTile(
        value: isSelected,
        onChanged: (v) => onToggle(v ?? false),
        title: Text(label, style: theme.textTheme.bodyMedium),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        activeColor: theme.colorScheme.primary,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
