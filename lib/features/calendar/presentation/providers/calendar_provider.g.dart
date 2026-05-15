// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCalendarEventsHash() => r'211b67fac5c1c834bd9fd47f3143e1ccfdb3e92e';

/// See also [getCalendarEvents].
@ProviderFor(getCalendarEvents)
final getCalendarEventsProvider =
    AutoDisposeProvider<GetCalendarEvents>.internal(
  getCalendarEvents,
  name: r'getCalendarEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCalendarEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCalendarEventsRef = AutoDisposeProviderRef<GetCalendarEvents>;
String _$calendarPaidDatesHash() => r'5d406c5ac0d9158463637a2a6aadeb070c6026b0';

/// See also [calendarPaidDates].
@ProviderFor(calendarPaidDates)
final calendarPaidDatesProvider =
    AutoDisposeFutureProvider<Set<String>>.internal(
  calendarPaidDates,
  name: r'calendarPaidDatesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarPaidDatesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarPaidDatesRef = AutoDisposeFutureProviderRef<Set<String>>;
String _$calendarEventsHash() => r'fdf9888e5e3c00a4620d486e2dcd1079cf61de1d';

/// See also [calendarEvents].
@ProviderFor(calendarEvents)
final calendarEventsProvider =
    AutoDisposeProvider<Map<DateTime, List<CalendarEvent>>>.internal(
  calendarEvents,
  name: r'calendarEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarEventsRef
    = AutoDisposeProviderRef<Map<DateTime, List<CalendarEvent>>>;
String _$eventsForDayHash() => r'ec77444042851c4d8e3a7fdbd7aa8c5d713fd570';

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

/// Events for a specific selected day (used by day detail panel).
///
/// Copied from [eventsForDay].
@ProviderFor(eventsForDay)
const eventsForDayProvider = EventsForDayFamily();

/// Events for a specific selected day (used by day detail panel).
///
/// Copied from [eventsForDay].
class EventsForDayFamily extends Family<List<CalendarEvent>> {
  /// Events for a specific selected day (used by day detail panel).
  ///
  /// Copied from [eventsForDay].
  const EventsForDayFamily();

  /// Events for a specific selected day (used by day detail panel).
  ///
  /// Copied from [eventsForDay].
  EventsForDayProvider call(
    DateTime day,
  ) {
    return EventsForDayProvider(
      day,
    );
  }

  @override
  EventsForDayProvider getProviderOverride(
    covariant EventsForDayProvider provider,
  ) {
    return call(
      provider.day,
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
  String? get name => r'eventsForDayProvider';
}

/// Events for a specific selected day (used by day detail panel).
///
/// Copied from [eventsForDay].
class EventsForDayProvider extends AutoDisposeProvider<List<CalendarEvent>> {
  /// Events for a specific selected day (used by day detail panel).
  ///
  /// Copied from [eventsForDay].
  EventsForDayProvider(
    DateTime day,
  ) : this._internal(
          (ref) => eventsForDay(
            ref as EventsForDayRef,
            day,
          ),
          from: eventsForDayProvider,
          name: r'eventsForDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventsForDayHash,
          dependencies: EventsForDayFamily._dependencies,
          allTransitiveDependencies:
              EventsForDayFamily._allTransitiveDependencies,
          day: day,
        );

  EventsForDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.day,
  }) : super.internal();

  final DateTime day;

  @override
  Override overrideWith(
    List<CalendarEvent> Function(EventsForDayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: EventsForDayProvider._internal(
        (ref) => create(ref as EventsForDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        day: day,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<CalendarEvent>> createElement() {
    return _EventsForDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EventsForDayProvider && other.day == day;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, day.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EventsForDayRef on AutoDisposeProviderRef<List<CalendarEvent>> {
  /// The parameter `day` of this provider.
  DateTime get day;
}

class _EventsForDayProviderElement
    extends AutoDisposeProviderElement<List<CalendarEvent>>
    with EventsForDayRef {
  _EventsForDayProviderElement(super.provider);

  @override
  DateTime get day => (origin as EventsForDayProvider).day;
}

String _$calendarMonthlyTotalHash() =>
    r'1e6eac5b4c96df7faa77aaa74c1c618c996dc129';

/// Monthly total for the currently focused month (shown in header).
///
/// Copied from [calendarMonthlyTotal].
@ProviderFor(calendarMonthlyTotal)
final calendarMonthlyTotalProvider =
    AutoDisposeProvider<(double, String)>.internal(
  calendarMonthlyTotal,
  name: r'calendarMonthlyTotalProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarMonthlyTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalendarMonthlyTotalRef = AutoDisposeProviderRef<(double, String)>;
String _$calendarFocusedMonthHash() =>
    r'2ac1471443b26532540141ff18602ede7c47c9bf';

/// See also [CalendarFocusedMonth].
@ProviderFor(CalendarFocusedMonth)
final calendarFocusedMonthProvider =
    AutoDisposeNotifierProvider<CalendarFocusedMonth, DateTime>.internal(
  CalendarFocusedMonth.new,
  name: r'calendarFocusedMonthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calendarFocusedMonthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalendarFocusedMonth = AutoDisposeNotifier<DateTime>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
