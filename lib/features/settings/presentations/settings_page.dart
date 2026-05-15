import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/currency_formatter.dart';
import '../../../core/ads/ads_provider.dart';
import 'package:startapp_sdk/startapp.dart';
import '../domain/entities/app_settings.dart';
import 'settings_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(appSettingsNotifierProvider);
    final isBiometricSupported =
        ref.watch(biometricSupportProvider).valueOrNull ?? false;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(l10n.settingsTitle),
            pinned: true,
            centerTitle: false,
          ),
          settingsAsync.when(
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) =>
                SliverFillRemaining(child: Center(child: Text('Error: $e'))),
            data: (settings) => SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _SectionLabel(l10n.settingsSectionAppearance),
                  _ThemeTile(current: settings.theme),
                  _LanguageTile(current: settings.language),

                  const SizedBox(height: 24),
                  _SectionLabel(l10n.settingsSectionGeneral),
                  _CurrencyTile(current: settings.defaultCurrency),

                  const SizedBox(height: 24),
                  _SectionLabel(l10n.settingsSectionNotifications),
                  _NotificationToggleTile(
                    enabled: settings.notificationsEnabled,
                  ),
                  if (settings.notificationsEnabled)
                    _ReminderTimeTile(
                      hour: settings.reminderHour,
                      minute: settings.reminderMinute,
                    ),

                  if (isBiometricSupported) ...[
                    const SizedBox(height: 24),
                    _SectionLabel(l10n.settingsSectionSecurity),
                    _BiometricTile(enabled: settings.biometricLock),
                  ],

                  const SizedBox(height: 24),
                  _SectionLabel(l10n.settingsSectionAds),
                  const _AdsTile(),

                  const SizedBox(height: 24),
                  _SectionLabel(l10n.settingsSectionAbout),
                  const _AboutTiles(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  SECTION LABEL
// ══════════════════════════════════════════════════════════════════

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  SETTING TILE BASE
// ══════════════════════════════════════════════════════════════════

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  const _SettingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = iconColor ?? theme.colorScheme.primary;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(
          alpha: 0.35,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
        trailing:
            trailing ??
            (onTap != null
                ? Icon(
                    Icons.chevron_right,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                  )
                : null),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  APPEARANCE
// ══════════════════════════════════════════════════════════════════

class _ThemeTile extends ConsumerWidget {
  final AppTheme current;
  const _ThemeTile({required this.current});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    final options = [
      (
        AppTheme.system,
        l10n.settingsThemeSystem,
        Icons.brightness_auto_rounded,
      ),
      (AppTheme.light, l10n.settingsThemeLight, Icons.light_mode_rounded),
      (AppTheme.dark, l10n.settingsThemeDark, Icons.dark_mode_rounded),
    ];

    final currentLabel = options.firstWhere((o) => o.$1 == current).$2;

    return _SettingTile(
      icon: Icons.palette_rounded,
      title: l10n.settingsThemeTitle,
      subtitle: currentLabel,
      onTap: () => _showPicker(context, ref, options, l10n),
    );
  }

  void _showPicker(
    BuildContext context,
    WidgetRef ref,
    List<(AppTheme, String, IconData)> options,
    AppLocalizations l10n,
  ) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (sheetCtx) => _PickerSheet(
        title: l10n.settingsThemePickerTitle,
        children: options.map((opt) {
          final (theme, label, icon) = opt;
          return _PickerOption(
            icon: icon,
            label: label,
            selected: current == theme,
            onTap: () {
              Navigator.of(sheetCtx).pop();
              ref.read(appSettingsNotifierProvider.notifier).setTheme(theme);
            },
          );
        }).toList(),
      ),
    );
  }
}

class _LanguageTile extends ConsumerWidget {
  final String current;
  const _LanguageTile({required this.current});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    const options = [('id', 'Bahasa Indonesia'), ('en', 'English')];
    final currentLabel = options.firstWhere((o) => o.$1 == current).$2;

    return _SettingTile(
      icon: Icons.language_rounded,
      title: l10n.settingsLanguageTitle,
      subtitle: currentLabel,
      onTap: () => _showPicker(context, ref, options, l10n),
    );
  }

  void _showPicker(
    BuildContext context,
    WidgetRef ref,
    List<(String, String)> options,
    AppLocalizations l10n,
  ) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (sheetCtx) => _PickerSheet(
        title: l10n.settingsLanguagePickerTitle,
        children: options.map((opt) {
          final (code, label) = opt;
          return _PickerOption(
            icon: Icons.translate_rounded,
            label: label,
            selected: current == code,
            onTap: () {
              Navigator.of(sheetCtx).pop();
              ref.read(appSettingsNotifierProvider.notifier).setLanguage(code);
            },
          );
        }).toList(),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  GENERAL
// ══════════════════════════════════════════════════════════════════

class _CurrencyTile extends ConsumerWidget {
  final String current;
  const _CurrencyTile({required this.current});

  static const _currencies = ['IDR', 'USD', 'EUR', 'SGD'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final sym = CurrencyFormatter.symbol(current);
    return _SettingTile(
      icon: Icons.monetization_on_rounded,
      title: l10n.settingsCurrencyTitle,
      subtitle: '$current ($sym)',
      onTap: () => _showPicker(context, ref, l10n),
    );
  }

  void _showPicker(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (sheetCtx) => _PickerSheet(
        title: l10n.settingsCurrencyPickerTitle,
        children: _currencies.map((c) {
          final sym = CurrencyFormatter.symbol(c);
          return _PickerOption(
            icon: Icons.attach_money_rounded,
            label: '$c — $sym',
            selected: current == c,
            onTap: () {
              ref
                  .read(appSettingsNotifierProvider.notifier)
                  .setDefaultCurrency(c);
              Navigator.of(sheetCtx).pop();
            },
          );
        }).toList(),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  NOTIFICATIONS
// ══════════════════════════════════════════════════════════════════

class _NotificationToggleTile extends ConsumerWidget {
  final bool enabled;
  const _NotificationToggleTile({required this.enabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return _SettingTile(
      icon: Icons.notifications_rounded,
      title: l10n.settingsNotificationsTitle,
      subtitle: enabled
          ? l10n.settingsNotificationsActive
          : l10n.settingsNotificationsPaused,
      iconColor: enabled
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.outline,
      trailing: Switch.adaptive(
        value: enabled,
        onChanged: (v) => ref
            .read(appSettingsNotifierProvider.notifier)
            .setNotificationsEnabled(v),
      ),
    );
  }
}

class _ReminderTimeTile extends ConsumerWidget {
  final int hour;
  final int minute;
  const _ReminderTimeTile({required this.hour, required this.minute});

  String get _timeLabel {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return _SettingTile(
      icon: Icons.access_time_rounded,
      title: l10n.settingsReminderTimeTitle,
      subtitle: l10n.settingsReminderTimeSubtitle(_timeLabel),
      onTap: () async {
        final picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: hour, minute: minute),
          helpText: l10n.settingsReminderTimeHelp,
        );
        if (picked != null) {
          await ref
              .read(appSettingsNotifierProvider.notifier)
              .setReminderTime(picked);
        }
      },
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  SECURITY
// ══════════════════════════════════════════════════════════════════

class _BiometricTile extends ConsumerWidget {
  final bool enabled;
  const _BiometricTile({required this.enabled});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return _SettingTile(
      icon: Icons.fingerprint_rounded,
      title: l10n.settingsBiometricTitle,
      subtitle: enabled
          ? l10n.settingsBiometricLocked
          : l10n.settingsBiometricUnlocked,
      trailing: Switch.adaptive(
        value: enabled,
        onChanged: (v) async {
          final auth = LocalAuthentication();
          try {
            final didAuthenticate = await auth.authenticate(
              localizedReason:
                  'Please authenticate to change biometric lock settings',
              biometricOnly: false,
            );
            if (didAuthenticate) {
              ref
                  .read(appSettingsNotifierProvider.notifier)
                  .setBiometricLock(v);
            }
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Authentication failed: $e')),
              );
            }
          }
        },
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  ABOUT
// ══════════════════════════════════════════════════════════════════

class _AboutTiles extends ConsumerWidget {
  const _AboutTiles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appInfoAsync = ref.watch(appInfoProvider);

    final versionLabel = appInfoAsync.when(
      data: (info) => info.buildNumber.isNotEmpty && !kReleaseMode
          ? '${info.version} (${info.buildNumber})'
          : info.version,
      loading: () => '...',
      error: (_, __) => '—',
    );

    return Column(
      children: [
        _SettingTile(
          icon: Icons.info_outline_rounded,
          title: l10n.settingsVersionTitle,
          subtitle: versionLabel,
          iconColor: Theme.of(context).colorScheme.secondary,
        ),
        _SettingTile(
          icon: Icons.privacy_tip_outlined,
          title: l10n.settingsPrivacyTitle,
          subtitle: l10n.settingsPrivacySubtitle,
          iconColor: Theme.of(context).colorScheme.tertiary,
        ),
        _SettingTile(
          icon: Icons.delete_outline_rounded,
          title: l10n.settingsClearDataTitle,
          subtitle: l10n.settingsClearDataSubtitle,
          iconColor: Theme.of(context).colorScheme.error,
          onTap: () => _confirmClear(context, ref),
        ),
      ],
    );
  }

  void _confirmClear(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (_dialogCtx) => AlertDialog(
        title: Text(l10n.dialogClearDataTitle),
        content: Text(l10n.dialogClearDataContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(_dialogCtx),
            child: Text(l10n.actionCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () async {
              Navigator.pop(_dialogCtx);
              await ref
                  .read(appSettingsNotifierProvider.notifier)
                  .clearAllData();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.settingsDataClearedSuccess)),
                );
              }
            },
            child: Text(l10n.dialogClearDataConfirm),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  ADS
// ══════════════════════════════════════════════════════════════════

class _AdsTile extends ConsumerStatefulWidget {
  const _AdsTile();

  @override
  ConsumerState<_AdsTile> createState() => _AdsTileState();
}

class _AdsTileState extends ConsumerState<_AdsTile> {
  bool _isLoading = false;

  Future<void> _showRewardedVideo() async {
    setState(() => _isLoading = true);
    final l10n = AppLocalizations.of(context)!;
    try {
      final startAppSdk = StartAppSdk();
      final rewardedAd = await startAppSdk.loadRewardedVideoAd();

      final isWatched = await rewardedAd.show();
      if (isWatched) {
        await ref
            .read(appSettingsNotifierProvider.notifier)
            .hideAdsFor24Hours();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.settingsAdsHiddenSuccess)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settingsAdsLoadFailed(e.toString()))),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final showAds = ref.watch(shouldShowAdsProvider);

    if (!showAds) {
      final settings = ref.watch(appSettingsNotifierProvider).valueOrNull;
      final expiry = settings?.adsHiddenUntil;
      String remaining = '';
      if (expiry != null) {
        final diff = expiry.difference(DateTime.now());
        remaining = ' (${diff.inHours}h ${diff.inMinutes % 60}m)';
      }
      return _SettingTile(
        icon: Icons.check_circle_outline_rounded,
        title: l10n.settingsHideAdsTitle,
        subtitle: '${l10n.settingsAdsDisabled}$remaining',
        iconColor: Theme.of(context).colorScheme.primary,
      );
    }

    return _SettingTile(
      icon: Icons.ondemand_video_rounded,
      title: l10n.settingsHideAdsTitle,
      subtitle: l10n.settingsHideAdsSubtitle,
      iconColor: Theme.of(context).colorScheme.secondary,
      trailing: _isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              Icons.chevron_right,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.3),
            ),
      onTap: _isLoading ? null : _showRewardedVideo,
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  SHARED BOTTOM SHEET COMPONENTS
// ══════════════════════════════════════════════════════════════════

class _PickerSheet extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _PickerSheet({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            ...children,
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _PickerOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PickerOption({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 20,
        color: selected
            ? theme.colorScheme.primary
            : theme.colorScheme.onSurface.withValues(alpha: 0.5),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          color: selected ? theme.colorScheme.primary : null,
        ),
      ),
      trailing: selected
          ? Icon(
              Icons.check_rounded,
              color: theme.colorScheme.primary,
              size: 20,
            )
          : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
