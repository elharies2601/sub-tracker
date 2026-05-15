// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Reminder {

 int get id; int get subscriptionId; int get daysBefore;// 0 = day-of, 1, 3, 7, etc.
 TimeOfDay get remindTime; bool get isEnabled; DateTime get createdAt;
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderCopyWith<Reminder> get copyWith => _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.daysBefore, daysBefore) || other.daysBefore == daysBefore)&&(identical(other.remindTime, remindTime) || other.remindTime == remindTime)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,daysBefore,remindTime,isEnabled,createdAt);

@override
String toString() {
  return 'Reminder(id: $id, subscriptionId: $subscriptionId, daysBefore: $daysBefore, remindTime: $remindTime, isEnabled: $isEnabled, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res>  {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) = _$ReminderCopyWithImpl;
@useResult
$Res call({
 int id, int subscriptionId, int daysBefore, TimeOfDay remindTime, bool isEnabled, DateTime createdAt
});




}
/// @nodoc
class _$ReminderCopyWithImpl<$Res>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subscriptionId = null,Object? daysBefore = null,Object? remindTime = null,Object? isEnabled = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,daysBefore: null == daysBefore ? _self.daysBefore : daysBefore // ignore: cast_nullable_to_non_nullable
as int,remindTime: null == remindTime ? _self.remindTime : remindTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reminder value)  $default,){
final _that = this;
switch (_that) {
case _Reminder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reminder value)?  $default,){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int subscriptionId,  int daysBefore,  TimeOfDay remindTime,  bool isEnabled,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.subscriptionId,_that.daysBefore,_that.remindTime,_that.isEnabled,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int subscriptionId,  int daysBefore,  TimeOfDay remindTime,  bool isEnabled,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Reminder():
return $default(_that.id,_that.subscriptionId,_that.daysBefore,_that.remindTime,_that.isEnabled,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int subscriptionId,  int daysBefore,  TimeOfDay remindTime,  bool isEnabled,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.id,_that.subscriptionId,_that.daysBefore,_that.remindTime,_that.isEnabled,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Reminder implements Reminder {
  const _Reminder({required this.id, required this.subscriptionId, required this.daysBefore, required this.remindTime, this.isEnabled = true, required this.createdAt});
  

@override final  int id;
@override final  int subscriptionId;
@override final  int daysBefore;
// 0 = day-of, 1, 3, 7, etc.
@override final  TimeOfDay remindTime;
@override@JsonKey() final  bool isEnabled;
@override final  DateTime createdAt;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderCopyWith<_Reminder> get copyWith => __$ReminderCopyWithImpl<_Reminder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reminder&&(identical(other.id, id) || other.id == id)&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.daysBefore, daysBefore) || other.daysBefore == daysBefore)&&(identical(other.remindTime, remindTime) || other.remindTime == remindTime)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,subscriptionId,daysBefore,remindTime,isEnabled,createdAt);

@override
String toString() {
  return 'Reminder(id: $id, subscriptionId: $subscriptionId, daysBefore: $daysBefore, remindTime: $remindTime, isEnabled: $isEnabled, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) = __$ReminderCopyWithImpl;
@override @useResult
$Res call({
 int id, int subscriptionId, int daysBefore, TimeOfDay remindTime, bool isEnabled, DateTime createdAt
});




}
/// @nodoc
class __$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subscriptionId = null,Object? daysBefore = null,Object? remindTime = null,Object? isEnabled = null,Object? createdAt = null,}) {
  return _then(_Reminder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,daysBefore: null == daysBefore ? _self.daysBefore : daysBefore // ignore: cast_nullable_to_non_nullable
as int,remindTime: null == remindTime ? _self.remindTime : remindTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
