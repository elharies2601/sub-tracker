// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Reminder {
  int get id => throw _privateConstructorUsedError;
  int get subscriptionId => throw _privateConstructorUsedError;
  int get daysBefore =>
      throw _privateConstructorUsedError; // 0 = day-of, 1, 3, 7, etc.
  TimeOfDay get remindTime => throw _privateConstructorUsedError;
  bool get isEnabled => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {int id,
      int subscriptionId,
      int daysBefore,
      TimeOfDay remindTime,
      bool isEnabled,
      DateTime createdAt});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? daysBefore = null,
    Object? remindTime = null,
    Object? isEnabled = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      remindTime: null == remindTime
          ? _value.remindTime
          : remindTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int subscriptionId,
      int daysBefore,
      TimeOfDay remindTime,
      bool isEnabled,
      DateTime createdAt});
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? daysBefore = null,
    Object? remindTime = null,
    Object? isEnabled = null,
    Object? createdAt = null,
  }) {
    return _then(_$ReminderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      remindTime: null == remindTime
          ? _value.remindTime
          : remindTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ReminderImpl implements _Reminder {
  const _$ReminderImpl(
      {required this.id,
      required this.subscriptionId,
      required this.daysBefore,
      required this.remindTime,
      this.isEnabled = true,
      required this.createdAt});

  @override
  final int id;
  @override
  final int subscriptionId;
  @override
  final int daysBefore;
// 0 = day-of, 1, 3, 7, etc.
  @override
  final TimeOfDay remindTime;
  @override
  @JsonKey()
  final bool isEnabled;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Reminder(id: $id, subscriptionId: $subscriptionId, daysBefore: $daysBefore, remindTime: $remindTime, isEnabled: $isEnabled, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.daysBefore, daysBefore) ||
                other.daysBefore == daysBefore) &&
            (identical(other.remindTime, remindTime) ||
                other.remindTime == remindTime) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, subscriptionId, daysBefore,
      remindTime, isEnabled, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);
}

abstract class _Reminder implements Reminder {
  const factory _Reminder(
      {required final int id,
      required final int subscriptionId,
      required final int daysBefore,
      required final TimeOfDay remindTime,
      final bool isEnabled,
      required final DateTime createdAt}) = _$ReminderImpl;

  @override
  int get id;
  @override
  int get subscriptionId;
  @override
  int get daysBefore;
  @override // 0 = day-of, 1, 3, 7, etc.
  TimeOfDay get remindTime;
  @override
  bool get isEnabled;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
