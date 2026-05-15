import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'SubTracker'**
  String get appTitle;

  /// No description provided for @navSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'Subscriptions'**
  String get navSubscriptions;

  /// No description provided for @navDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get navDashboard;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsSectionAppearance;

  /// No description provided for @settingsSectionGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsSectionGeneral;

  /// No description provided for @settingsSectionNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsSectionNotifications;

  /// No description provided for @settingsSectionSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSectionSecurity;

  /// No description provided for @settingsSectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsSectionAbout;

  /// No description provided for @settingsSectionAds.
  ///
  /// In en, this message translates to:
  /// **'Premium Features'**
  String get settingsSectionAds;

  /// No description provided for @settingsHideAdsTitle.
  ///
  /// In en, this message translates to:
  /// **'Hide Ads'**
  String get settingsHideAdsTitle;

  /// No description provided for @settingsHideAdsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch a video to be ad-free for 24 hours'**
  String get settingsHideAdsSubtitle;

  /// No description provided for @settingsAdsHiddenSuccess.
  ///
  /// In en, this message translates to:
  /// **'Ads hidden for 24 hours!'**
  String get settingsAdsHiddenSuccess;

  /// No description provided for @settingsAdsLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load ad: {error}'**
  String settingsAdsLoadFailed(String error);

  /// No description provided for @settingsAdsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Ads disabled'**
  String get settingsAdsDisabled;

  /// No description provided for @settingsThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsThemeTitle;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get settingsThemeSystem;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose theme'**
  String get settingsThemePickerTitle;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @settingsLanguagePickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get settingsLanguagePickerTitle;

  /// No description provided for @settingsCurrencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Default currency'**
  String get settingsCurrencyTitle;

  /// No description provided for @settingsCurrencyPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose currency'**
  String get settingsCurrencyPickerTitle;

  /// No description provided for @settingsNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotificationsTitle;

  /// No description provided for @settingsNotificationsActive.
  ///
  /// In en, this message translates to:
  /// **'Reminders are active'**
  String get settingsNotificationsActive;

  /// No description provided for @settingsNotificationsPaused.
  ///
  /// In en, this message translates to:
  /// **'All reminders paused'**
  String get settingsNotificationsPaused;

  /// No description provided for @settingsReminderTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get settingsReminderTimeTitle;

  /// No description provided for @settingsReminderTimeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Daily notifications at {time}'**
  String settingsReminderTimeSubtitle(String time);

  /// No description provided for @settingsReminderTimeHelp.
  ///
  /// In en, this message translates to:
  /// **'Reminder time'**
  String get settingsReminderTimeHelp;

  /// No description provided for @settingsBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometric lock'**
  String get settingsBiometricTitle;

  /// No description provided for @settingsBiometricLocked.
  ///
  /// In en, this message translates to:
  /// **'App locked on startup'**
  String get settingsBiometricLocked;

  /// No description provided for @settingsBiometricUnlocked.
  ///
  /// In en, this message translates to:
  /// **'No lock'**
  String get settingsBiometricUnlocked;

  /// No description provided for @settingsVersionTitle.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get settingsVersionTitle;

  /// No description provided for @settingsPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacyTitle;

  /// No description provided for @settingsPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'All data stays on your device'**
  String get settingsPrivacySubtitle;

  /// No description provided for @settingsClearDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all data'**
  String get settingsClearDataTitle;

  /// No description provided for @settingsClearDataSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all subscriptions and history'**
  String get settingsClearDataSubtitle;

  /// No description provided for @dialogClearDataTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all data?'**
  String get dialogClearDataTitle;

  /// No description provided for @dialogClearDataContent.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all your subscriptions, reminders, and payment history. App settings will remain intact. This action cannot be undone.'**
  String get dialogClearDataContent;

  /// No description provided for @dialogClearDataConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete everything'**
  String get dialogClearDataConfirm;

  /// No description provided for @settingsDataClearedSuccess.
  ///
  /// In en, this message translates to:
  /// **'All subscription data has been cleared.'**
  String get settingsDataClearedSuccess;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @subListTitle.
  ///
  /// In en, this message translates to:
  /// **'My subscriptions'**
  String get subListTitle;

  /// No description provided for @subListAddLabel.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get subListAddLabel;

  /// No description provided for @subListMonthlySpend.
  ///
  /// In en, this message translates to:
  /// **'Monthly spend'**
  String get subListMonthlySpend;

  /// No description provided for @subListNoBillsThisWeek.
  ///
  /// In en, this message translates to:
  /// **'No upcoming bills this week'**
  String get subListNoBillsThisWeek;

  /// No description provided for @subListBillsDueThisWeek.
  ///
  /// In en, this message translates to:
  /// **'{count} bill(s) due this week'**
  String subListBillsDueThisWeek(int count);

  /// No description provided for @subListEmpty.
  ///
  /// In en, this message translates to:
  /// **'No subscriptions yet'**
  String get subListEmpty;

  /// No description provided for @subListEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first one'**
  String get subListEmptyHint;

  /// No description provided for @subDetailConfirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get subDetailConfirmPayment;

  /// No description provided for @subDetailPer.
  ///
  /// In en, this message translates to:
  /// **'per {cycle}'**
  String subDetailPer(String cycle);

  /// No description provided for @subDetailOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue by {days} day(s)'**
  String subDetailOverdue(int days);

  /// No description provided for @subDetailDueToday.
  ///
  /// In en, this message translates to:
  /// **'Due today'**
  String get subDetailDueToday;

  /// No description provided for @subDetailDueInDays.
  ///
  /// In en, this message translates to:
  /// **'Due in {days} day(s)'**
  String subDetailDueInDays(int days);

  /// No description provided for @subDetailDueInDaysPlain.
  ///
  /// In en, this message translates to:
  /// **'Due in {days} days'**
  String subDetailDueInDaysPlain(int days);

  /// No description provided for @subDetailNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get subDetailNotes;

  /// No description provided for @subDetailPaymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment history'**
  String get subDetailPaymentHistory;

  /// No description provided for @subDetailCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get subDetailCategory;

  /// No description provided for @subDetailBilling.
  ///
  /// In en, this message translates to:
  /// **'Billing'**
  String get subDetailBilling;

  /// No description provided for @subDetailStarted.
  ///
  /// In en, this message translates to:
  /// **'Started'**
  String get subDetailStarted;

  /// No description provided for @subDetailStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get subDetailStatus;

  /// No description provided for @subDetailMonthlyCost.
  ///
  /// In en, this message translates to:
  /// **'Monthly cost'**
  String get subDetailMonthlyCost;

  /// No description provided for @subDetailYearlyCost.
  ///
  /// In en, this message translates to:
  /// **'Yearly cost'**
  String get subDetailYearlyCost;

  /// No description provided for @subDetailPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get subDetailPause;

  /// No description provided for @subDetailResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get subDetailResume;

  /// No description provided for @subDetailReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get subDetailReminders;

  /// No description provided for @subFormAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add subscription'**
  String get subFormAddTitle;

  /// No description provided for @subFormEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit subscription'**
  String get subFormEditTitle;

  /// No description provided for @subFormNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get subFormNameLabel;

  /// No description provided for @subFormNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get subFormNameRequired;

  /// No description provided for @subFormAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount *'**
  String get subFormAmountLabel;

  /// No description provided for @subFormAmountRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get subFormAmountRequired;

  /// No description provided for @subFormAmountInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get subFormAmountInvalid;

  /// No description provided for @subFormAmountPositive.
  ///
  /// In en, this message translates to:
  /// **'Must be > 0'**
  String get subFormAmountPositive;

  /// No description provided for @subFormCurrencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get subFormCurrencyLabel;

  /// No description provided for @subFormCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get subFormCategoryLabel;

  /// No description provided for @subFormBillingCycleLabel.
  ///
  /// In en, this message translates to:
  /// **'Billing cycle'**
  String get subFormBillingCycleLabel;

  /// No description provided for @subFormBillingDayLabel.
  ///
  /// In en, this message translates to:
  /// **'Billing day'**
  String get subFormBillingDayLabel;

  /// No description provided for @subFormBillingDayHelper.
  ///
  /// In en, this message translates to:
  /// **'Day of month (1–28) or week (1=Mon)'**
  String get subFormBillingDayHelper;

  /// No description provided for @subFormBillingDayRange.
  ///
  /// In en, this message translates to:
  /// **'Enter 1–28'**
  String get subFormBillingDayRange;

  /// No description provided for @subFormStartDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get subFormStartDateLabel;

  /// No description provided for @subFormNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get subFormNotesLabel;

  /// No description provided for @subFormAddButton.
  ///
  /// In en, this message translates to:
  /// **'Add subscription'**
  String get subFormAddButton;

  /// No description provided for @subFormSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get subFormSaveButton;

  /// No description provided for @cardBadgeOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get cardBadgeOverdue;

  /// No description provided for @cardBadgeDueToday.
  ///
  /// In en, this message translates to:
  /// **'Due today'**
  String get cardBadgeDueToday;

  /// No description provided for @cardDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete subscription?'**
  String get cardDeleteTitle;

  /// No description provided for @cardDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" permanently.'**
  String cardDeleteContent(String name);

  /// No description provided for @paymentNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No payments recorded yet'**
  String get paymentNoHistory;

  /// No description provided for @paymentConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get paymentConfirmTitle;

  /// No description provided for @paymentAmountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount paid'**
  String get paymentAmountPaid;

  /// No description provided for @paymentNotesLabel.
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get paymentNotesLabel;

  /// No description provided for @paymentNotesHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Paid via credit card'**
  String get paymentNotesHint;

  /// No description provided for @paymentSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get paymentSaving;

  /// No description provided for @paymentConfirmButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get paymentConfirmButton;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @dashboardMonthlySpend.
  ///
  /// In en, this message translates to:
  /// **'Monthly spend'**
  String get dashboardMonthlySpend;

  /// No description provided for @dashboardPerYear.
  ///
  /// In en, this message translates to:
  /// **'{amount} / year'**
  String dashboardPerYear(String amount);

  /// No description provided for @dashboardStatActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get dashboardStatActive;

  /// No description provided for @dashboardStatPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get dashboardStatPaused;

  /// No description provided for @dashboardStatCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get dashboardStatCategories;

  /// No description provided for @dashboardStatSubscriptions.
  ///
  /// In en, this message translates to:
  /// **'subscriptions'**
  String get dashboardStatSubscriptions;

  /// No description provided for @dashboardSpendingByCategory.
  ///
  /// In en, this message translates to:
  /// **'Spending by category'**
  String get dashboardSpendingByCategory;

  /// No description provided for @dashboardMonthlyBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Monthly breakdown'**
  String get dashboardMonthlyBreakdown;

  /// No description provided for @dashboardMonthlyTrend.
  ///
  /// In en, this message translates to:
  /// **'Monthly trend'**
  String get dashboardMonthlyTrend;

  /// No description provided for @dashboardLast6Months.
  ///
  /// In en, this message translates to:
  /// **'Last 6 months'**
  String get dashboardLast6Months;

  /// No description provided for @dashboardUpcomingThisWeek.
  ///
  /// In en, this message translates to:
  /// **'Upcoming this week'**
  String get dashboardUpcomingThisWeek;

  /// No description provided for @dashboardNext7Days.
  ///
  /// In en, this message translates to:
  /// **'Next 7 days'**
  String get dashboardNext7Days;

  /// No description provided for @dashboardNoBillsNext7Days.
  ///
  /// In en, this message translates to:
  /// **'No bills due in the next 7 days'**
  String get dashboardNoBillsNext7Days;

  /// No description provided for @dashboardBadgeToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dashboardBadgeToday;

  /// No description provided for @dashboardBadgeTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get dashboardBadgeTomorrow;

  /// No description provided for @dashboardBadgeDays.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String dashboardBadgeDays(int days);

  /// No description provided for @dashboardEmpty.
  ///
  /// In en, this message translates to:
  /// **'No data yet'**
  String get dashboardEmpty;

  /// No description provided for @dashboardEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Add subscriptions to see your spending overview'**
  String get dashboardEmptyHint;

  /// No description provided for @reminderAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders – {name}'**
  String reminderAppBarTitle(String name);

  /// No description provided for @reminderNotifyBefore.
  ///
  /// In en, this message translates to:
  /// **'Notify me before due date'**
  String get reminderNotifyBefore;

  /// No description provided for @reminderRemindAt.
  ///
  /// In en, this message translates to:
  /// **'Remind me at'**
  String get reminderRemindAt;

  /// No description provided for @reminderTapToChange.
  ///
  /// In en, this message translates to:
  /// **'Tap to change'**
  String get reminderTapToChange;

  /// No description provided for @reminderSelectTime.
  ///
  /// In en, this message translates to:
  /// **'Select reminder time'**
  String get reminderSelectTime;

  /// No description provided for @reminderSaveAtLeastOne.
  ///
  /// In en, this message translates to:
  /// **'Select at least one reminder'**
  String get reminderSaveAtLeastOne;

  /// No description provided for @reminderSaved.
  ///
  /// In en, this message translates to:
  /// **'Reminders saved'**
  String get reminderSaved;

  /// No description provided for @reminderDisableAll.
  ///
  /// In en, this message translates to:
  /// **'Disable all reminders'**
  String get reminderDisableAll;

  /// No description provided for @reminderAllDisabled.
  ///
  /// In en, this message translates to:
  /// **'All reminders disabled'**
  String get reminderAllDisabled;

  /// No description provided for @reminderInfoText.
  ///
  /// In en, this message translates to:
  /// **'Reminders are scheduled locally on your device. They will be rescheduled automatically each time you open the app.'**
  String get reminderInfoText;

  /// No description provided for @reminder7DaysBefore.
  ///
  /// In en, this message translates to:
  /// **'7 days before'**
  String get reminder7DaysBefore;

  /// No description provided for @reminder7DaysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'One week ahead'**
  String get reminder7DaysSubtitle;

  /// No description provided for @reminder3DaysBefore.
  ///
  /// In en, this message translates to:
  /// **'3 days before'**
  String get reminder3DaysBefore;

  /// No description provided for @reminder3DaysSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A few days to prepare'**
  String get reminder3DaysSubtitle;

  /// No description provided for @reminder1DayBefore.
  ///
  /// In en, this message translates to:
  /// **'1 day before'**
  String get reminder1DayBefore;

  /// No description provided for @reminder1DaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Final reminder'**
  String get reminder1DaySubtitle;

  /// No description provided for @reminderOnTheDay.
  ///
  /// In en, this message translates to:
  /// **'On the day'**
  String get reminderOnTheDay;

  /// No description provided for @reminderOnTheDaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'When payment is due'**
  String get reminderOnTheDaySubtitle;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track all your subscriptions in one place. Never miss a payment again.'**
  String get onboardingWelcomeSubtitle;

  /// No description provided for @onboardingWelcomeButton.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingWelcomeButton;

  /// No description provided for @onboardingFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Everything you need'**
  String get onboardingFeaturesTitle;

  /// No description provided for @onboardingFeaturesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simple, focused, and private.'**
  String get onboardingFeaturesSubtitle;

  /// No description provided for @onboardingFeature1Title.
  ///
  /// In en, this message translates to:
  /// **'Track subscriptions'**
  String get onboardingFeature1Title;

  /// No description provided for @onboardingFeature1Desc.
  ///
  /// In en, this message translates to:
  /// **'Add all your subscriptions with billing cycle and amount.'**
  String get onboardingFeature1Desc;

  /// No description provided for @onboardingFeature2Title.
  ///
  /// In en, this message translates to:
  /// **'Smart reminders'**
  String get onboardingFeature2Title;

  /// No description provided for @onboardingFeature2Desc.
  ///
  /// In en, this message translates to:
  /// **'Get notified 7, 3, or 1 day before each payment is due.'**
  String get onboardingFeature2Desc;

  /// No description provided for @onboardingFeature3Title.
  ///
  /// In en, this message translates to:
  /// **'Spending overview'**
  String get onboardingFeature3Title;

  /// No description provided for @onboardingFeature3Desc.
  ///
  /// In en, this message translates to:
  /// **'See how much you spend monthly per category.'**
  String get onboardingFeature3Desc;

  /// No description provided for @onboardingFeature4Title.
  ///
  /// In en, this message translates to:
  /// **'Fully offline'**
  String get onboardingFeature4Title;

  /// No description provided for @onboardingFeature4Desc.
  ///
  /// In en, this message translates to:
  /// **'All your data stays on your device. No account needed.'**
  String get onboardingFeature4Desc;

  /// No description provided for @onboardingSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick setup'**
  String get onboardingSetupTitle;

  /// No description provided for @onboardingSetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can always change these in Settings.'**
  String get onboardingSetupSubtitle;

  /// No description provided for @onboardingSetupReminderTime.
  ///
  /// In en, this message translates to:
  /// **'Daily reminder time'**
  String get onboardingSetupReminderTime;

  /// No description provided for @onboardingDoneTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get onboardingDoneTitle;

  /// No description provided for @onboardingDoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start adding your subscriptions and\nSubTracker will handle the rest.'**
  String get onboardingDoneSubtitle;

  /// No description provided for @onboardingDoneButton.
  ///
  /// In en, this message translates to:
  /// **'Add your first subscription'**
  String get onboardingDoneButton;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @noBillsOnThisDay.
  ///
  /// In en, this message translates to:
  /// **'No bills on this day'**
  String get noBillsOnThisDay;

  /// No description provided for @totalThisMonth.
  ///
  /// In en, this message translates to:
  /// **'Total this month: {total}'**
  String totalThisMonth(String total);

  /// No description provided for @statusPaid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get statusPaid;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
