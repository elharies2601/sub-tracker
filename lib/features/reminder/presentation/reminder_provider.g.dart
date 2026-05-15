// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationSchedulerHash() =>
    r'0b7b61336ccbf83faca9af437b258301e3695d13';

/// See also [notificationScheduler].
@ProviderFor(notificationScheduler)
final notificationSchedulerProvider =
    AutoDisposeProvider<NotificationScheduler>.internal(
  notificationScheduler,
  name: r'notificationSchedulerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationSchedulerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationSchedulerRef
    = AutoDisposeProviderRef<NotificationScheduler>;
String _$reminderLocalDsHash() => r'd3518eabc5396c44a547c632806126a9ebd64656';

/// See also [reminderLocalDs].
@ProviderFor(reminderLocalDs)
final reminderLocalDsProvider =
    AutoDisposeProvider<ReminderLocalDataSource>.internal(
  reminderLocalDs,
  name: r'reminderLocalDsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reminderLocalDsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReminderLocalDsRef = AutoDisposeProviderRef<ReminderLocalDataSource>;
String _$reminderRepositoryHash() =>
    r'f7c2f6d0ca7867103bb84e7c60f312684beff5b6';

/// See also [reminderRepository].
@ProviderFor(reminderRepository)
final reminderRepositoryProvider =
    AutoDisposeProvider<ReminderRepository>.internal(
  reminderRepository,
  name: r'reminderRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reminderRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReminderRepositoryRef = AutoDisposeProviderRef<ReminderRepository>;
String _$scheduleRemindersHash() => r'f945641623e66d66a951adc8dce796efbb62da30';

/// See also [scheduleReminders].
@ProviderFor(scheduleReminders)
final scheduleRemindersProvider =
    AutoDisposeProvider<ScheduleReminders>.internal(
  scheduleReminders,
  name: r'scheduleRemindersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$scheduleRemindersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ScheduleRemindersRef = AutoDisposeProviderRef<ScheduleReminders>;
String _$cancelRemindersHash() => r'3107f0b2d66d30d5dacccf0513a3e5507142d059';

/// See also [cancelReminders].
@ProviderFor(cancelReminders)
final cancelRemindersProvider = AutoDisposeProvider<CancelReminders>.internal(
  cancelReminders,
  name: r'cancelRemindersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cancelRemindersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CancelRemindersRef = AutoDisposeProviderRef<CancelReminders>;
String _$rescheduleAllHash() => r'8678a97bee99bcb3082d60de0175703a7e309b69';

/// See also [rescheduleAll].
@ProviderFor(rescheduleAll)
final rescheduleAllProvider = AutoDisposeProvider<RescheduleAll>.internal(
  rescheduleAll,
  name: r'rescheduleAllProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rescheduleAllHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RescheduleAllRef = AutoDisposeProviderRef<RescheduleAll>;
String _$remindersForSubscriptionHash() =>
    r'c013bf5ec6c53f856aec8a51136eed3b0b7963d1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [remindersForSubscription].
@ProviderFor(remindersForSubscription)
const remindersForSubscriptionProvider = RemindersForSubscriptionFamily();

/// See also [remindersForSubscription].
class RemindersForSubscriptionFamily
    extends Family<AsyncValue<List<Reminder>>> {
  /// See also [remindersForSubscription].
  const RemindersForSubscriptionFamily();

  /// See also [remindersForSubscription].
  RemindersForSubscriptionProvider call(
    int subscriptionId,
  ) {
    return RemindersForSubscriptionProvider(
      subscriptionId,
    );
  }

  @override
  RemindersForSubscriptionProvider getProviderOverride(
    covariant RemindersForSubscriptionProvider provider,
  ) {
    return call(
      provider.subscriptionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'remindersForSubscriptionProvider';
}

/// See also [remindersForSubscription].
class RemindersForSubscriptionProvider
    extends AutoDisposeFutureProvider<List<Reminder>> {
  /// See also [remindersForSubscription].
  RemindersForSubscriptionProvider(
    int subscriptionId,
  ) : this._internal(
          (ref) => remindersForSubscription(
            ref as RemindersForSubscriptionRef,
            subscriptionId,
          ),
          from: remindersForSubscriptionProvider,
          name: r'remindersForSubscriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$remindersForSubscriptionHash,
          dependencies: RemindersForSubscriptionFamily._dependencies,
          allTransitiveDependencies:
              RemindersForSubscriptionFamily._allTransitiveDependencies,
          subscriptionId: subscriptionId,
        );

  RemindersForSubscriptionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subscriptionId,
  }) : super.internal();

  final int subscriptionId;

  @override
  Override overrideWith(
    FutureOr<List<Reminder>> Function(RemindersForSubscriptionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemindersForSubscriptionProvider._internal(
        (ref) => create(ref as RemindersForSubscriptionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subscriptionId: subscriptionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Reminder>> createElement() {
    return _RemindersForSubscriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemindersForSubscriptionProvider &&
        other.subscriptionId == subscriptionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemindersForSubscriptionRef
    on AutoDisposeFutureProviderRef<List<Reminder>> {
  /// The parameter `subscriptionId` of this provider.
  int get subscriptionId;
}

class _RemindersForSubscriptionProviderElement
    extends AutoDisposeFutureProviderElement<List<Reminder>>
    with RemindersForSubscriptionRef {
  _RemindersForSubscriptionProviderElement(super.provider);

  @override
  int get subscriptionId =>
      (origin as RemindersForSubscriptionProvider).subscriptionId;
}

String _$reminderNotifierHash() => r'cfcd65fd6e90dd2260f35f0f2040a968225db7fe';

/// See also [ReminderNotifier].
@ProviderFor(ReminderNotifier)
final reminderNotifierProvider =
    AutoDisposeNotifierProvider<ReminderNotifier, AsyncValue<void>>.internal(
  ReminderNotifier.new,
  name: r'reminderNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reminderNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReminderNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
