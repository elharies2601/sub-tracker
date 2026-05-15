// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCalendarEvents)
const getCalendarEventsProvider = GetCalendarEventsProvider._();

final class GetCalendarEventsProvider
    extends
        $FunctionalProvider<
          GetCalendarEvents,
          GetCalendarEvents,
          GetCalendarEvents
        >
    with $Provider<GetCalendarEvents> {
  const GetCalendarEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCalendarEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCalendarEventsHash();

  @$internal
  @override
  $ProviderElement<GetCalendarEvents> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCalendarEvents create(Ref ref) {
    return getCalendarEvents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCalendarEvents value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCalendarEvents>(value),
    );
  }
}

String _$getCalendarEventsHash() => r'211b67fac5c1c834bd9fd47f3143e1ccfdb3e92e';

@ProviderFor(CalendarFocusedMonth)
const calendarFocusedMonthProvider = CalendarFocusedMonthProvider._();

final class CalendarFocusedMonthProvider
    extends $NotifierProvider<CalendarFocusedMonth, DateTime> {
  const CalendarFocusedMonthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarFocusedMonthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarFocusedMonthHash();

  @$internal
  @override
  CalendarFocusedMonth create() => CalendarFocusedMonth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$calendarFocusedMonthHash() =>
    r'2ac1471443b26532540141ff18602ede7c47c9bf';

abstract class _$CalendarFocusedMonth extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(calendarPaidDates)
const calendarPaidDatesProvider = CalendarPaidDatesProvider._();

final class CalendarPaidDatesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<String>>,
          Set<String>,
          FutureOr<Set<String>>
        >
    with $FutureModifier<Set<String>>, $FutureProvider<Set<String>> {
  const CalendarPaidDatesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarPaidDatesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarPaidDatesHash();

  @$internal
  @override
  $FutureProviderElement<Set<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Set<String>> create(Ref ref) {
    return calendarPaidDates(ref);
  }
}

String _$calendarPaidDatesHash() => r'5d406c5ac0d9158463637a2a6aadeb070c6026b0';

@ProviderFor(calendarEvents)
const calendarEventsProvider = CalendarEventsProvider._();

final class CalendarEventsProvider
    extends
        $FunctionalProvider<
          Map<DateTime, List<CalendarEvent>>,
          Map<DateTime, List<CalendarEvent>>,
          Map<DateTime, List<CalendarEvent>>
        >
    with $Provider<Map<DateTime, List<CalendarEvent>>> {
  const CalendarEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarEventsHash();

  @$internal
  @override
  $ProviderElement<Map<DateTime, List<CalendarEvent>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<DateTime, List<CalendarEvent>> create(Ref ref) {
    return calendarEvents(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<DateTime, List<CalendarEvent>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<DateTime, List<CalendarEvent>>>(
        value,
      ),
    );
  }
}

String _$calendarEventsHash() => r'fdf9888e5e3c00a4620d486e2dcd1079cf61de1d';

/// Events for a specific selected day (used by day detail panel).

@ProviderFor(eventsForDay)
const eventsForDayProvider = EventsForDayFamily._();

/// Events for a specific selected day (used by day detail panel).

final class EventsForDayProvider
    extends
        $FunctionalProvider<
          List<CalendarEvent>,
          List<CalendarEvent>,
          List<CalendarEvent>
        >
    with $Provider<List<CalendarEvent>> {
  /// Events for a specific selected day (used by day detail panel).
  const EventsForDayProvider._({
    required EventsForDayFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'eventsForDayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$eventsForDayHash();

  @override
  String toString() {
    return r'eventsForDayProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<CalendarEvent>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<CalendarEvent> create(Ref ref) {
    final argument = this.argument as DateTime;
    return eventsForDay(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CalendarEvent> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CalendarEvent>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EventsForDayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$eventsForDayHash() => r'ec77444042851c4d8e3a7fdbd7aa8c5d713fd570';

/// Events for a specific selected day (used by day detail panel).

final class EventsForDayFamily extends $Family
    with $FunctionalFamilyOverride<List<CalendarEvent>, DateTime> {
  const EventsForDayFamily._()
    : super(
        retry: null,
        name: r'eventsForDayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Events for a specific selected day (used by day detail panel).

  EventsForDayProvider call(DateTime day) =>
      EventsForDayProvider._(argument: day, from: this);

  @override
  String toString() => r'eventsForDayProvider';
}

/// Monthly total for the currently focused month (shown in header).

@ProviderFor(calendarMonthlyTotal)
const calendarMonthlyTotalProvider = CalendarMonthlyTotalProvider._();

/// Monthly total for the currently focused month (shown in header).

final class CalendarMonthlyTotalProvider
    extends
        $FunctionalProvider<
          (double, String),
          (double, String),
          (double, String)
        >
    with $Provider<(double, String)> {
  /// Monthly total for the currently focused month (shown in header).
  const CalendarMonthlyTotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'calendarMonthlyTotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$calendarMonthlyTotalHash();

  @$internal
  @override
  $ProviderElement<(double, String)> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  (double, String) create(Ref ref) {
    return calendarMonthlyTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((double, String) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(double, String)>(value),
    );
  }
}

String _$calendarMonthlyTotalHash() =>
    r'1e6eac5b4c96df7faa77aaa74c1c618c996dc129';
