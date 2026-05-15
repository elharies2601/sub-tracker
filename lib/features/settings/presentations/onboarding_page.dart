import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/currency_formatter.dart';
import '../../../l10n/app_localizations.dart';
import 'settings_provider.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final _pageCtrl = PageController();
  int _currentPage = 0;

  // Setup state (collected on page 3)
  String _currency = 'IDR';
  String _language = 'id';
  TimeOfDay _reminderTime = const TimeOfDay(hour: 9, minute: 0);

  static const _totalPages = 4;

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentPage < _totalPages - 1) {
      _pageCtrl.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prev() {
    _pageCtrl.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finish() async {
    await ref
        .read(appSettingsProvider.notifier)
        .completeOnboarding(
          currency: _currency,
          language: _language,
          reminderTime: _reminderTime,
        );
    if (mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLastPage = _currentPage == _totalPages - 1;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ── Skip button ──────────────────────────────────────
            Align(
              alignment: Alignment.topRight,
              child: _currentPage < _totalPages - 1
                  ? TextButton(
                      onPressed: _finish,
                      child: Text(
                        l10n.skip,
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.45,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(height: 40),
            ),

            // ── Pages ────────────────────────────────────────────
            Expanded(
              child: PageView(
                controller: _pageCtrl,
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _WelcomePage(onNext: _next),
                  _FeaturesPage(onNext: _next),
                  _SetupPage(
                    currency: _currency,
                    language: _language,
                    reminderTime: _reminderTime,
                    onCurrencyChanged: (v) => setState(() => _currency = v),
                    onLanguageChanged: (v) => setState(() => _language = v),
                    onReminderTimeChanged: (v) =>
                        setState(() => _reminderTime = v),
                    onNext: _next,
                  ),
                  _DonePage(onFinish: _finish),
                ],
              ),
            ),

            // ── Page indicator + nav ─────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Row(
                children: [
                  // Back
                  if (_currentPage > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_rounded),
                      onPressed: _prev,
                    )
                  else
                    const SizedBox(width: 48),

                  // Dots
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_totalPages, (i) {
                        final isActive = i == _currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? 20 : 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: isActive
                                ? theme.colorScheme.primary
                                : theme.colorScheme.primary.withValues(
                                    alpha: 0.2,
                                  ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),

                  // Next / Finish
                  FilledButton(
                    onPressed: isLastPage ? _finish : _next,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(48, 48),
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      isLastPage
                          ? Icons.check_rounded
                          : Icons.arrow_forward_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  PAGE 1 — WELCOME
// ══════════════════════════════════════════════════════════════════

class _WelcomePage extends StatelessWidget {
  final VoidCallback onNext;
  const _WelcomePage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // App icon illustration
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Icon(
              Icons.subscriptions_rounded,
              size: 64,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            l10n.appTitle,
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingWelcomeSubtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          FilledButton(
            onPressed: onNext,
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: Text(
              l10n.onboardingWelcomeButton,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  PAGE 2 — FEATURES
// ══════════════════════════════════════════════════════════════════

class _FeaturesPage extends StatelessWidget {
  final VoidCallback onNext;
  const _FeaturesPage({required this.onNext});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final features = [
      (
        Icons.list_alt_rounded,
        l10n.onboardingFeature1Title,
        l10n.onboardingFeature1Desc,
      ),
      (
        Icons.notifications_active_rounded,
        l10n.onboardingFeature2Title,
        l10n.onboardingFeature2Desc,
      ),
      (
        Icons.bar_chart_rounded,
        l10n.onboardingFeature3Title,
        l10n.onboardingFeature3Desc,
      ),
      (
        Icons.wifi_off_rounded,
        l10n.onboardingFeature4Title,
        l10n.onboardingFeature4Desc,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            l10n.onboardingFeaturesTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.onboardingFeaturesSubtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView(
              children: features
                  .map(
                    (f) => _FeatureTile(
                      icon: f.$1,
                      title: f.$2,
                      description: f.$3,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                    height: 1.4,
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

// ══════════════════════════════════════════════════════════════════
//  PAGE 3 — SETUP
// ══════════════════════════════════════════════════════════════════

class _SetupPage extends StatelessWidget {
  final String currency;
  final String language;
  final TimeOfDay reminderTime;
  final ValueChanged<String> onCurrencyChanged;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<TimeOfDay> onReminderTimeChanged;
  final VoidCallback onNext;

  const _SetupPage({
    required this.currency,
    required this.language,
    required this.reminderTime,
    required this.onCurrencyChanged,
    required this.onLanguageChanged,
    required this.onReminderTimeChanged,
    required this.onNext,
  });

  String get _timeLabel {
    final h = reminderTime.hour.toString().padLeft(2, '0');
    final m = reminderTime.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            l10n.onboardingSetupTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.onboardingSetupSubtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
          const SizedBox(height: 32),

          // ── Currency ─────────────────────────────────────────
          _SetupLabel(l10n.settingsCurrencyTitle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: ['IDR'].map((c) {
              final selected = currency == c;
              final sym = CurrencyFormatter.symbol(c);
              return GestureDetector(
                onTap: () => onCurrencyChanged(c),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHighest.withValues(
                            alpha: 0.5,
                          ),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outlineVariant.withValues(
                              alpha: 0.4,
                            ),
                    ),
                  ),
                  child: Text(
                    '$c  $sym',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: selected
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 28),

          // ── Language ─────────────────────────────────────────
          _SetupLabel(l10n.settingsLanguageTitle),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children:
                [('id', '🇮🇩  Bahasa Indonesia'), ('en', '🇺🇸  English')].map(
                  (opt) {
                    final selected = language == opt.$1;
                    return GestureDetector(
                      onTap: () => onLanguageChanged(opt.$1),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.surfaceContainerHighest
                                    .withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outlineVariant.withValues(
                                    alpha: 0.4,
                                  ),
                          ),
                        ),
                        child: Text(
                          opt.$2,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: selected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
          ),

          const SizedBox(height: 28),

          // ── Reminder time ─────────────────────────────────────
          _SetupLabel(l10n.onboardingSetupReminderTime),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: reminderTime,
              );
              if (picked != null) onReminderTimeChanged(picked);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest.withValues(
                  alpha: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.4,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _timeLabel,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SetupLabel extends StatelessWidget {
  final String text;
  const _SetupLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════
//  PAGE 4 — DONE
// ══════════════════════════════════════════════════════════════════

class _DonePage extends StatelessWidget {
  final VoidCallback onFinish;
  const _DonePage({required this.onFinish});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated checkmark
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
            builder: (_, scale, child) =>
                Transform.scale(scale: scale, child: child),
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                size: 60,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 36),
          Text(
            l10n.onboardingDoneTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.onboardingDoneSubtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          FilledButton.icon(
            onPressed: onFinish,
            icon: const Icon(Icons.add_rounded),
            label: Text(
              l10n.onboardingDoneButton,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
