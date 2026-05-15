// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SubTracker';

  @override
  String get navSubscriptions => 'Subscriptions';

  @override
  String get navDashboard => 'Dashboard';

  @override
  String get navSettings => 'Settings';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionAppearance => 'Appearance';

  @override
  String get settingsSectionGeneral => 'General';

  @override
  String get settingsSectionNotifications => 'Notifications';

  @override
  String get settingsSectionSecurity => 'Security';

  @override
  String get settingsSectionAbout => 'About';

  @override
  String get settingsSectionAds => 'Premium Features';

  @override
  String get settingsHideAdsTitle => 'Hide Ads';

  @override
  String get settingsHideAdsSubtitle =>
      'Watch a video to be ad-free for 24 hours';

  @override
  String get settingsAdsHiddenSuccess => 'Ads hidden for 24 hours!';

  @override
  String settingsAdsLoadFailed(String error) {
    return 'Failed to load ad: $error';
  }

  @override
  String get settingsAdsDisabled => 'Ads disabled';

  @override
  String get settingsThemeTitle => 'Theme';

  @override
  String get settingsThemeSystem => 'Follow system';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemePickerTitle => 'Choose theme';

  @override
  String get settingsLanguageTitle => 'Language';

  @override
  String get settingsLanguagePickerTitle => 'Choose language';

  @override
  String get settingsCurrencyTitle => 'Default currency';

  @override
  String get settingsCurrencyPickerTitle => 'Choose currency';

  @override
  String get settingsNotificationsTitle => 'Notifications';

  @override
  String get settingsNotificationsActive => 'Reminders are active';

  @override
  String get settingsNotificationsPaused => 'All reminders paused';

  @override
  String get settingsReminderTimeTitle => 'Reminder time';

  @override
  String settingsReminderTimeSubtitle(String time) {
    return 'Daily notifications at $time';
  }

  @override
  String get settingsReminderTimeHelp => 'Reminder time';

  @override
  String get settingsBiometricTitle => 'Biometric lock';

  @override
  String get settingsBiometricLocked => 'App locked on startup';

  @override
  String get settingsBiometricUnlocked => 'No lock';

  @override
  String get settingsVersionTitle => 'Version';

  @override
  String get settingsPrivacyTitle => 'Privacy';

  @override
  String get settingsPrivacySubtitle => 'All data stays on your device';

  @override
  String get settingsClearDataTitle => 'Clear all data';

  @override
  String get settingsClearDataSubtitle =>
      'Delete all subscriptions and history';

  @override
  String get dialogClearDataTitle => 'Clear all data?';

  @override
  String get dialogClearDataContent =>
      'This will permanently delete all your subscriptions, reminders, and payment history. App settings will remain intact. This action cannot be undone.';

  @override
  String get dialogClearDataConfirm => 'Delete everything';

  @override
  String get settingsDataClearedSuccess =>
      'All subscription data has been cleared.';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionSave => 'Save';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionEdit => 'Edit';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get subListTitle => 'My subscriptions';

  @override
  String get subListAddLabel => 'Add';

  @override
  String get subListMonthlySpend => 'Monthly spend';

  @override
  String get subListNoBillsThisWeek => 'No upcoming bills this week';

  @override
  String subListBillsDueThisWeek(int count) {
    return '$count bill(s) due this week';
  }

  @override
  String get subListEmpty => 'No subscriptions yet';

  @override
  String get subListEmptyHint => 'Tap + to add your first one';

  @override
  String get subDetailConfirmPayment => 'Confirm payment';

  @override
  String subDetailPer(String cycle) {
    return 'per $cycle';
  }

  @override
  String subDetailOverdue(int days) {
    return 'Overdue by $days day(s)';
  }

  @override
  String get subDetailDueToday => 'Due today';

  @override
  String subDetailDueInDays(int days) {
    return 'Due in $days day(s)';
  }

  @override
  String subDetailDueInDaysPlain(int days) {
    return 'Due in $days days';
  }

  @override
  String get subDetailNotes => 'Notes';

  @override
  String get subDetailPaymentHistory => 'Payment history';

  @override
  String get subDetailCategory => 'Category';

  @override
  String get subDetailBilling => 'Billing';

  @override
  String get subDetailStarted => 'Started';

  @override
  String get subDetailStatus => 'Status';

  @override
  String get subDetailMonthlyCost => 'Monthly cost';

  @override
  String get subDetailYearlyCost => 'Yearly cost';

  @override
  String get subDetailPause => 'Pause';

  @override
  String get subDetailResume => 'Resume';

  @override
  String get subDetailReminders => 'Reminders';

  @override
  String get subFormAddTitle => 'Add subscription';

  @override
  String get subFormEditTitle => 'Edit subscription';

  @override
  String get subFormNameLabel => 'Name *';

  @override
  String get subFormNameRequired => 'Name is required';

  @override
  String get subFormAmountLabel => 'Amount *';

  @override
  String get subFormAmountRequired => 'Required';

  @override
  String get subFormAmountInvalid => 'Invalid number';

  @override
  String get subFormAmountPositive => 'Must be > 0';

  @override
  String get subFormCurrencyLabel => 'Currency';

  @override
  String get subFormCategoryLabel => 'Category';

  @override
  String get subFormBillingCycleLabel => 'Billing cycle';

  @override
  String get subFormBillingDayLabel => 'Billing day';

  @override
  String get subFormBillingDayHelper => 'Day of month (1–28) or week (1=Mon)';

  @override
  String get subFormBillingDayRange => 'Enter 1–28';

  @override
  String get subFormStartDateLabel => 'Start date';

  @override
  String get subFormNotesLabel => 'Notes (optional)';

  @override
  String get subFormAddButton => 'Add subscription';

  @override
  String get subFormSaveButton => 'Save changes';

  @override
  String get cardBadgeOverdue => 'Overdue';

  @override
  String get cardBadgeDueToday => 'Due today';

  @override
  String get cardDeleteTitle => 'Delete subscription?';

  @override
  String cardDeleteContent(String name) {
    return 'Remove \"$name\" permanently.';
  }

  @override
  String get paymentNoHistory => 'No payments recorded yet';

  @override
  String get paymentConfirmTitle => 'Confirm payment';

  @override
  String get paymentAmountPaid => 'Amount paid';

  @override
  String get paymentNotesLabel => 'Notes (optional)';

  @override
  String get paymentNotesHint => 'e.g. Paid via credit card';

  @override
  String get paymentSaving => 'Saving…';

  @override
  String get paymentConfirmButton => 'Confirm payment';

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get dashboardMonthlySpend => 'Monthly spend';

  @override
  String dashboardPerYear(String amount) {
    return '$amount / year';
  }

  @override
  String get dashboardStatActive => 'Active';

  @override
  String get dashboardStatPaused => 'Paused';

  @override
  String get dashboardStatCategories => 'Categories';

  @override
  String get dashboardStatSubscriptions => 'subscriptions';

  @override
  String get dashboardSpendingByCategory => 'Spending by category';

  @override
  String get dashboardMonthlyBreakdown => 'Monthly breakdown';

  @override
  String get dashboardMonthlyTrend => 'Monthly trend';

  @override
  String get dashboardLast6Months => 'Last 6 months';

  @override
  String get dashboardUpcomingThisWeek => 'Upcoming this week';

  @override
  String get dashboardNext7Days => 'Next 7 days';

  @override
  String get dashboardNoBillsNext7Days => 'No bills due in the next 7 days';

  @override
  String get dashboardBadgeToday => 'Today';

  @override
  String get dashboardBadgeTomorrow => 'Tomorrow';

  @override
  String dashboardBadgeDays(int days) {
    return '$days days';
  }

  @override
  String get dashboardEmpty => 'No data yet';

  @override
  String get dashboardEmptyHint =>
      'Add subscriptions to see your spending overview';

  @override
  String reminderAppBarTitle(String name) {
    return 'Reminders – $name';
  }

  @override
  String get reminderNotifyBefore => 'Notify me before due date';

  @override
  String get reminderRemindAt => 'Remind me at';

  @override
  String get reminderTapToChange => 'Tap to change';

  @override
  String get reminderSelectTime => 'Select reminder time';

  @override
  String get reminderSaveAtLeastOne => 'Select at least one reminder';

  @override
  String get reminderSaved => 'Reminders saved';

  @override
  String get reminderDisableAll => 'Disable all reminders';

  @override
  String get reminderAllDisabled => 'All reminders disabled';

  @override
  String get reminderInfoText =>
      'Reminders are scheduled locally on your device. They will be rescheduled automatically each time you open the app.';

  @override
  String get reminder7DaysBefore => '7 days before';

  @override
  String get reminder7DaysSubtitle => 'One week ahead';

  @override
  String get reminder3DaysBefore => '3 days before';

  @override
  String get reminder3DaysSubtitle => 'A few days to prepare';

  @override
  String get reminder1DayBefore => '1 day before';

  @override
  String get reminder1DaySubtitle => 'Final reminder';

  @override
  String get reminderOnTheDay => 'On the day';

  @override
  String get reminderOnTheDaySubtitle => 'When payment is due';

  @override
  String get skip => 'Skip';

  @override
  String get onboardingWelcomeSubtitle =>
      'Track all your subscriptions in one place. Never miss a payment again.';

  @override
  String get onboardingWelcomeButton => 'Get started';

  @override
  String get onboardingFeaturesTitle => 'Everything you need';

  @override
  String get onboardingFeaturesSubtitle => 'Simple, focused, and private.';

  @override
  String get onboardingFeature1Title => 'Track subscriptions';

  @override
  String get onboardingFeature1Desc =>
      'Add all your subscriptions with billing cycle and amount.';

  @override
  String get onboardingFeature2Title => 'Smart reminders';

  @override
  String get onboardingFeature2Desc =>
      'Get notified 7, 3, or 1 day before each payment is due.';

  @override
  String get onboardingFeature3Title => 'Spending overview';

  @override
  String get onboardingFeature3Desc =>
      'See how much you spend monthly per category.';

  @override
  String get onboardingFeature4Title => 'Fully offline';

  @override
  String get onboardingFeature4Desc =>
      'All your data stays on your device. No account needed.';

  @override
  String get onboardingSetupTitle => 'Quick setup';

  @override
  String get onboardingSetupSubtitle =>
      'You can always change these in Settings.';

  @override
  String get onboardingSetupReminderTime => 'Daily reminder time';

  @override
  String get onboardingDoneTitle => 'You\'re all set!';

  @override
  String get onboardingDoneSubtitle =>
      'Start adding your subscriptions and\nSubTracker will handle the rest.';

  @override
  String get onboardingDoneButton => 'Add your first subscription';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get noBillsOnThisDay => 'No bills on this day';

  @override
  String totalThisMonth(String total) {
    return 'Total this month: $total';
  }

  @override
  String get statusPaid => 'Paid';
}
