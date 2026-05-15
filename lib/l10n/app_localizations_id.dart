// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'SubTracker';

  @override
  String get navSubscriptions => 'Langganan';

  @override
  String get navDashboard => 'Dasbor';

  @override
  String get navSettings => 'Pengaturan';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get settingsSectionAppearance => 'Tampilan';

  @override
  String get settingsSectionGeneral => 'Umum';

  @override
  String get settingsSectionNotifications => 'Notifikasi';

  @override
  String get settingsSectionSecurity => 'Keamanan';

  @override
  String get settingsSectionAbout => 'Tentang';

  @override
  String get settingsSectionAds => 'Fitur Premium';

  @override
  String get settingsHideAdsTitle => 'Hilangkan Iklan';

  @override
  String get settingsHideAdsSubtitle => 'Tonton video untuk bebas iklan 24 jam';

  @override
  String get settingsAdsHiddenSuccess => 'Iklan disembunyikan selama 24 jam!';

  @override
  String settingsAdsLoadFailed(String error) {
    return 'Gagal memuat iklan: $error';
  }

  @override
  String get settingsAdsDisabled => 'Iklan nonaktif';

  @override
  String get settingsThemeTitle => 'Tema';

  @override
  String get settingsThemeSystem => 'Ikuti sistem';

  @override
  String get settingsThemeLight => 'Terang';

  @override
  String get settingsThemeDark => 'Gelap';

  @override
  String get settingsThemePickerTitle => 'Pilih tema';

  @override
  String get settingsLanguageTitle => 'Bahasa';

  @override
  String get settingsLanguagePickerTitle => 'Pilih bahasa';

  @override
  String get settingsCurrencyTitle => 'Mata uang default';

  @override
  String get settingsCurrencyPickerTitle => 'Pilih mata uang';

  @override
  String get settingsNotificationsTitle => 'Notifikasi';

  @override
  String get settingsNotificationsActive => 'Pengingat aktif';

  @override
  String get settingsNotificationsPaused => 'Semua pengingat dijeda';

  @override
  String get settingsReminderTimeTitle => 'Waktu pengingat';

  @override
  String settingsReminderTimeSubtitle(String time) {
    return 'Notifikasi harian pukul $time';
  }

  @override
  String get settingsReminderTimeHelp => 'Waktu pengingat';

  @override
  String get settingsBiometricTitle => 'Kunci biometrik';

  @override
  String get settingsBiometricLocked => 'Aplikasi dikunci saat dibuka';

  @override
  String get settingsBiometricUnlocked => 'Tidak ada kunci';

  @override
  String get settingsVersionTitle => 'Versi';

  @override
  String get settingsPrivacyTitle => 'Privasi';

  @override
  String get settingsPrivacySubtitle =>
      'Semua data tersimpan di perangkat Anda';

  @override
  String get settingsClearDataTitle => 'Hapus semua data';

  @override
  String get settingsClearDataSubtitle => 'Hapus semua langganan dan riwayat';

  @override
  String get dialogClearDataTitle => 'Hapus semua data?';

  @override
  String get dialogClearDataContent =>
      'Ini akan menghapus secara permanen semua langganan, pengingat, dan riwayat pembayaran Anda. Pengaturan aplikasi tidak dihapus. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get dialogClearDataConfirm => 'Hapus semuanya';

  @override
  String get settingsDataClearedSuccess =>
      'Semua data langganan berhasil dihapus.';

  @override
  String get actionCancel => 'Batal';

  @override
  String get actionSave => 'Simpan';

  @override
  String get actionDelete => 'Hapus';

  @override
  String get actionEdit => 'Edit';

  @override
  String get comingSoon => 'Segera hadir';

  @override
  String get subListTitle => 'My Subscriptions';

  @override
  String get subListAddLabel => 'Tambah';

  @override
  String get subListMonthlySpend => 'Pengeluaran bulanan';

  @override
  String get subListNoBillsThisWeek => 'Tidak ada tagihan minggu ini';

  @override
  String subListBillsDueThisWeek(int count) {
    return '$count tagihan jatuh tempo minggu ini';
  }

  @override
  String get subListEmpty => 'Belum ada langganan';

  @override
  String get subListEmptyHint => 'Ketuk + untuk menambahkan yang pertama';

  @override
  String get subDetailConfirmPayment => 'Konfirmasi pembayaran';

  @override
  String subDetailPer(String cycle) {
    return 'per $cycle';
  }

  @override
  String subDetailOverdue(int days) {
    return 'Terlambat $days hari';
  }

  @override
  String get subDetailDueToday => 'Jatuh tempo hari ini';

  @override
  String subDetailDueInDays(int days) {
    return 'Jatuh tempo dalam $days hari';
  }

  @override
  String subDetailDueInDaysPlain(int days) {
    return 'Jatuh tempo dalam $days hari';
  }

  @override
  String get subDetailNotes => 'Catatan';

  @override
  String get subDetailPaymentHistory => 'Riwayat pembayaran';

  @override
  String get subDetailCategory => 'Kategori';

  @override
  String get subDetailBilling => 'Penagihan';

  @override
  String get subDetailStarted => 'Dimulai';

  @override
  String get subDetailStatus => 'Status';

  @override
  String get subDetailMonthlyCost => 'Biaya bulanan';

  @override
  String get subDetailYearlyCost => 'Biaya tahunan';

  @override
  String get subDetailPause => 'Jeda';

  @override
  String get subDetailResume => 'Lanjutkan';

  @override
  String get subDetailReminders => 'Pengingat';

  @override
  String get subFormAddTitle => 'Tambah langganan';

  @override
  String get subFormEditTitle => 'Edit langganan';

  @override
  String get subFormNameLabel => 'Nama *';

  @override
  String get subFormNameRequired => 'Nama wajib diisi';

  @override
  String get subFormAmountLabel => 'Jumlah *';

  @override
  String get subFormAmountRequired => 'Wajib diisi';

  @override
  String get subFormAmountInvalid => 'Angka tidak valid';

  @override
  String get subFormAmountPositive => 'Harus > 0';

  @override
  String get subFormCurrencyLabel => 'Mata uang';

  @override
  String get subFormCategoryLabel => 'Kategori';

  @override
  String get subFormBillingCycleLabel => 'Siklus penagihan';

  @override
  String get subFormBillingDayLabel => 'Hari penagihan';

  @override
  String get subFormBillingDayHelper =>
      'Hari dalam bulan (1–28) atau minggu (1=Sen)';

  @override
  String get subFormBillingDayRange => 'Masukkan 1–28';

  @override
  String get subFormStartDateLabel => 'Tanggal mulai';

  @override
  String get subFormNotesLabel => 'Catatan (opsional)';

  @override
  String get subFormAddButton => 'Tambah langganan';

  @override
  String get subFormSaveButton => 'Simpan perubahan';

  @override
  String get cardBadgeOverdue => 'Terlambat';

  @override
  String get cardBadgeDueToday => 'Jatuh tempo hari ini';

  @override
  String get cardDeleteTitle => 'Hapus langganan?';

  @override
  String cardDeleteContent(String name) {
    return 'Hapus \"$name\" secara permanen.';
  }

  @override
  String get paymentNoHistory => 'Belum ada pembayaran tercatat';

  @override
  String get paymentConfirmTitle => 'Konfirmasi pembayaran';

  @override
  String get paymentAmountPaid => 'Jumlah dibayar';

  @override
  String get paymentNotesLabel => 'Catatan (opsional)';

  @override
  String get paymentNotesHint => 'mis. Dibayar via kartu kredit';

  @override
  String get paymentSaving => 'Menyimpan…';

  @override
  String get paymentConfirmButton => 'Konfirmasi pembayaran';

  @override
  String get dashboardTitle => 'Dasbor';

  @override
  String get dashboardMonthlySpend => 'Pengeluaran bulanan';

  @override
  String dashboardPerYear(String amount) {
    return '$amount / tahun';
  }

  @override
  String get dashboardStatActive => 'Aktif';

  @override
  String get dashboardStatPaused => 'Dijeda';

  @override
  String get dashboardStatCategories => 'Kategori';

  @override
  String get dashboardStatSubscriptions => 'langganan';

  @override
  String get dashboardSpendingByCategory => 'Pengeluaran per kategori';

  @override
  String get dashboardMonthlyBreakdown => 'Rincian bulanan';

  @override
  String get dashboardMonthlyTrend => 'Tren bulanan';

  @override
  String get dashboardLast6Months => '6 bulan terakhir';

  @override
  String get dashboardUpcomingThisWeek => 'Tagihan minggu ini';

  @override
  String get dashboardNext7Days => '7 hari ke depan';

  @override
  String get dashboardNoBillsNext7Days =>
      'Tidak ada tagihan dalam 7 hari ke depan';

  @override
  String get dashboardBadgeToday => 'Hari ini';

  @override
  String get dashboardBadgeTomorrow => 'Besok';

  @override
  String dashboardBadgeDays(int days) {
    return '$days hari';
  }

  @override
  String get dashboardEmpty => 'Belum ada data';

  @override
  String get dashboardEmptyHint =>
      'Tambahkan langganan untuk melihat ringkasan pengeluaran';

  @override
  String reminderAppBarTitle(String name) {
    return 'Pengingat – $name';
  }

  @override
  String get reminderNotifyBefore => 'Ingatkan sebelum jatuh tempo';

  @override
  String get reminderRemindAt => 'Ingatkan pukul';

  @override
  String get reminderTapToChange => 'Ketuk untuk mengubah';

  @override
  String get reminderSelectTime => 'Pilih waktu pengingat';

  @override
  String get reminderSaveAtLeastOne => 'Pilih minimal satu pengingat';

  @override
  String get reminderSaved => 'Pengingat disimpan';

  @override
  String get reminderDisableAll => 'Nonaktifkan semua pengingat';

  @override
  String get reminderAllDisabled => 'Semua pengingat dinonaktifkan';

  @override
  String get reminderInfoText =>
      'Pengingat dijadwalkan secara lokal di perangkat Anda. Akan dijadwal ulang otomatis setiap kali Anda membuka aplikasi.';

  @override
  String get reminder7DaysBefore => '7 hari sebelumnya';

  @override
  String get reminder7DaysSubtitle => 'Satu minggu lebih awal';

  @override
  String get reminder3DaysBefore => '3 hari sebelumnya';

  @override
  String get reminder3DaysSubtitle => 'Beberapa hari untuk persiapan';

  @override
  String get reminder1DayBefore => '1 hari sebelumnya';

  @override
  String get reminder1DaySubtitle => 'Pengingat terakhir';

  @override
  String get reminderOnTheDay => 'Di hari yang sama';

  @override
  String get reminderOnTheDaySubtitle => 'Saat pembayaran jatuh tempo';

  @override
  String get skip => 'Lewati';

  @override
  String get onboardingWelcomeSubtitle =>
      'Lacak semua langganan Anda di satu tempat. Jangan pernah lewatkan pembayaran lagi.';

  @override
  String get onboardingWelcomeButton => 'Mulai';

  @override
  String get onboardingFeaturesTitle => 'Semua yang Anda butuhkan';

  @override
  String get onboardingFeaturesSubtitle => 'Sederhana, fokus, dan privat.';

  @override
  String get onboardingFeature1Title => 'Lacak langganan';

  @override
  String get onboardingFeature1Desc =>
      'Tambahkan semua langganan Anda beserta siklus penagihan dan jumlahnya.';

  @override
  String get onboardingFeature2Title => 'Pengingat pintar';

  @override
  String get onboardingFeature2Desc =>
      'Dapatkan notifikasi 7, 3, atau 1 hari sebelum setiap pembayaran jatuh tempo.';

  @override
  String get onboardingFeature3Title => 'Ringkasan pengeluaran';

  @override
  String get onboardingFeature3Desc =>
      'Lihat berapa banyak yang Anda habiskan setiap bulan per kategori.';

  @override
  String get onboardingFeature4Title => 'Sepenuhnya offline';

  @override
  String get onboardingFeature4Desc =>
      'Semua data Anda tetap di perangkat Anda. Tidak perlu akun.';

  @override
  String get onboardingSetupTitle => 'Pengaturan cepat';

  @override
  String get onboardingSetupSubtitle =>
      'Anda selalu dapat mengubah ini di Pengaturan.';

  @override
  String get onboardingSetupReminderTime => 'Waktu pengingat harian';

  @override
  String get onboardingDoneTitle => 'Semuanya siap!';

  @override
  String get onboardingDoneSubtitle =>
      'Mulai tambahkan langganan Anda dan\nSubTracker akan menangani sisanya.';

  @override
  String get onboardingDoneButton => 'Tambah langganan pertama Anda';

  @override
  String get actionConfirm => 'Konfirmasi';

  @override
  String get noBillsOnThisDay => 'Tidak ada tagihan pada hari ini';

  @override
  String totalThisMonth(String total) {
    return 'Total bulan ini: $total';
  }

  @override
  String get statusPaid => 'Lunas';
}
