// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationScheduler)
const notificationSchedulerProvider = NotificationSchedulerProvider._();

final class NotificationSchedulerProvider
    extends
        $FunctionalProvider<
          NotificationScheduler,
          NotificationScheduler,
          NotificationScheduler
        >
    with $Provider<NotificationScheduler> {
  const NotificationSchedulerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationSchedulerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationSchedulerHash();

  @$internal
  @override
  $ProviderElement<NotificationScheduler> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationScheduler create(Ref ref) {
    return notificationScheduler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationScheduler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationScheduler>(value),
    );
  }
}

String _$notificationSchedulerHash() =>
    r'0b7b61336ccbf83faca9af437b258301e3695d13';

@ProviderFor(reminderLocalDs)
const reminderLocalDsProvider = ReminderLocalDsProvider._();

final class ReminderLocalDsProvider
    extends
        $FunctionalProvider<
          ReminderLocalDataSource,
          ReminderLocalDataSource,
          ReminderLocalDataSource
        >
    with $Provider<ReminderLocalDataSource> {
  const ReminderLocalDsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderLocalDsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderLocalDsHash();

  @$internal
  @override
  $ProviderElement<ReminderLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReminderLocalDataSource create(Ref ref) {
    return reminderLocalDs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReminderLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReminderLocalDataSource>(value),
    );
  }
}

String _$reminderLocalDsHash() => r'd3518eabc5396c44a547c632806126a9ebd64656';

@ProviderFor(reminderRepository)
const reminderRepositoryProvider = ReminderRepositoryProvider._();

final class ReminderRepositoryProvider
    extends
        $FunctionalProvider<
          ReminderRepository,
          ReminderRepository,
          ReminderRepository
        >
    with $Provider<ReminderRepository> {
  const ReminderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReminderRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReminderRepository create(Ref ref) {
    return reminderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReminderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReminderRepository>(value),
    );
  }
}

String _$reminderRepositoryHash() =>
    r'f7c2f6d0ca7867103bb84e7c60f312684beff5b6';

@ProviderFor(scheduleReminders)
const scheduleRemindersProvider = ScheduleRemindersProvider._();

final class ScheduleRemindersProvider
    extends
        $FunctionalProvider<
          ScheduleReminders,
          ScheduleReminders,
          ScheduleReminders
        >
    with $Provider<ScheduleReminders> {
  const ScheduleRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scheduleRemindersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scheduleRemindersHash();

  @$internal
  @override
  $ProviderElement<ScheduleReminders> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScheduleReminders create(Ref ref) {
    return scheduleReminders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleReminders value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleReminders>(value),
    );
  }
}

String _$scheduleRemindersHash() => r'f945641623e66d66a951adc8dce796efbb62da30';

@ProviderFor(cancelReminders)
const cancelRemindersProvider = CancelRemindersProvider._();

final class CancelRemindersProvider
    extends
        $FunctionalProvider<CancelReminders, CancelReminders, CancelReminders>
    with $Provider<CancelReminders> {
  const CancelRemindersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cancelRemindersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cancelRemindersHash();

  @$internal
  @override
  $ProviderElement<CancelReminders> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CancelReminders create(Ref ref) {
    return cancelReminders(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CancelReminders value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CancelReminders>(value),
    );
  }
}

String _$cancelRemindersHash() => r'3107f0b2d66d30d5dacccf0513a3e5507142d059';

@ProviderFor(rescheduleAll)
const rescheduleAllProvider = RescheduleAllProvider._();

final class RescheduleAllProvider
    extends $FunctionalProvider<RescheduleAll, RescheduleAll, RescheduleAll>
    with $Provider<RescheduleAll> {
  const RescheduleAllProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rescheduleAllProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rescheduleAllHash();

  @$internal
  @override
  $ProviderElement<RescheduleAll> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RescheduleAll create(Ref ref) {
    return rescheduleAll(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RescheduleAll value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RescheduleAll>(value),
    );
  }
}

String _$rescheduleAllHash() => r'8678a97bee99bcb3082d60de0175703a7e309b69';

@ProviderFor(remindersForSubscription)
const remindersForSubscriptionProvider = RemindersForSubscriptionFamily._();

final class RemindersForSubscriptionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Reminder>>,
          List<Reminder>,
          FutureOr<List<Reminder>>
        >
    with $FutureModifier<List<Reminder>>, $FutureProvider<List<Reminder>> {
  const RemindersForSubscriptionProvider._({
    required RemindersForSubscriptionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'remindersForSubscriptionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$remindersForSubscriptionHash();

  @override
  String toString() {
    return r'remindersForSubscriptionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Reminder>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Reminder>> create(Ref ref) {
    final argument = this.argument as int;
    return remindersForSubscription(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RemindersForSubscriptionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$remindersForSubscriptionHash() =>
    r'c013bf5ec6c53f856aec8a51136eed3b0b7963d1';

final class RemindersForSubscriptionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Reminder>>, int> {
  const RemindersForSubscriptionFamily._()
    : super(
        retry: null,
        name: r'remindersForSubscriptionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RemindersForSubscriptionProvider call(int subscriptionId) =>
      RemindersForSubscriptionProvider._(argument: subscriptionId, from: this);

  @override
  String toString() => r'remindersForSubscriptionProvider';
}

@ProviderFor(ReminderNotifier)
const reminderProvider = ReminderNotifierProvider._();

final class ReminderNotifierProvider
    extends $NotifierProvider<ReminderNotifier, AsyncValue<void>> {
  const ReminderNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reminderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reminderNotifierHash();

  @$internal
  @override
  ReminderNotifier create() => ReminderNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$reminderNotifierHash() => r'cfcd65fd6e90dd2260f35f0f2040a968225db7fe';

abstract class _$ReminderNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
