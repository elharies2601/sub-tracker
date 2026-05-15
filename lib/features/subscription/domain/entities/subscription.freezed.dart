// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Subscription {

 int get id; String get name; String get category; double get amount; String get currency; BillingCycle get billingCycle; int get billingDay;// day of month/week billing occurs
 DateTime get startDate; DateTime get nextBillingDate; SubscriptionStatus get status; String? get notes; String? get iconUrl; String? get colorHex; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.billingCycle, billingCycle) || other.billingCycle == billingCycle)&&(identical(other.billingDay, billingDay) || other.billingDay == billingDay)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextBillingDate, nextBillingDate) || other.nextBillingDate == nextBillingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,amount,currency,billingCycle,billingDay,startDate,nextBillingDate,status,notes,iconUrl,colorHex,createdAt,updatedAt);

@override
String toString() {
  return 'Subscription(id: $id, name: $name, category: $category, amount: $amount, currency: $currency, billingCycle: $billingCycle, billingDay: $billingDay, startDate: $startDate, nextBillingDate: $nextBillingDate, status: $status, notes: $notes, iconUrl: $iconUrl, colorHex: $colorHex, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
 int id, String name, String category, double amount, String currency, BillingCycle billingCycle, int billingDay, DateTime startDate, DateTime nextBillingDate, SubscriptionStatus status, String? notes, String? iconUrl, String? colorHex, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? amount = null,Object? currency = null,Object? billingCycle = null,Object? billingDay = null,Object? startDate = null,Object? nextBillingDate = null,Object? status = null,Object? notes = freezed,Object? iconUrl = freezed,Object? colorHex = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,billingCycle: null == billingCycle ? _self.billingCycle : billingCycle // ignore: cast_nullable_to_non_nullable
as BillingCycle,billingDay: null == billingDay ? _self.billingDay : billingDay // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,nextBillingDate: null == nextBillingDate ? _self.nextBillingDate : nextBillingDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String category,  double amount,  String currency,  BillingCycle billingCycle,  int billingDay,  DateTime startDate,  DateTime nextBillingDate,  SubscriptionStatus status,  String? notes,  String? iconUrl,  String? colorHex,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.amount,_that.currency,_that.billingCycle,_that.billingDay,_that.startDate,_that.nextBillingDate,_that.status,_that.notes,_that.iconUrl,_that.colorHex,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String category,  double amount,  String currency,  BillingCycle billingCycle,  int billingDay,  DateTime startDate,  DateTime nextBillingDate,  SubscriptionStatus status,  String? notes,  String? iconUrl,  String? colorHex,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.id,_that.name,_that.category,_that.amount,_that.currency,_that.billingCycle,_that.billingDay,_that.startDate,_that.nextBillingDate,_that.status,_that.notes,_that.iconUrl,_that.colorHex,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String category,  double amount,  String currency,  BillingCycle billingCycle,  int billingDay,  DateTime startDate,  DateTime nextBillingDate,  SubscriptionStatus status,  String? notes,  String? iconUrl,  String? colorHex,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.amount,_that.currency,_that.billingCycle,_that.billingDay,_that.startDate,_that.nextBillingDate,_that.status,_that.notes,_that.iconUrl,_that.colorHex,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Subscription extends Subscription {
  const _Subscription({required this.id, required this.name, required this.category, required this.amount, required this.currency, required this.billingCycle, required this.billingDay, required this.startDate, required this.nextBillingDate, this.status = SubscriptionStatus.active, this.notes, this.iconUrl, this.colorHex, required this.createdAt, required this.updatedAt}): super._();
  

@override final  int id;
@override final  String name;
@override final  String category;
@override final  double amount;
@override final  String currency;
@override final  BillingCycle billingCycle;
@override final  int billingDay;
// day of month/week billing occurs
@override final  DateTime startDate;
@override final  DateTime nextBillingDate;
@override@JsonKey() final  SubscriptionStatus status;
@override final  String? notes;
@override final  String? iconUrl;
@override final  String? colorHex;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.billingCycle, billingCycle) || other.billingCycle == billingCycle)&&(identical(other.billingDay, billingDay) || other.billingDay == billingDay)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.nextBillingDate, nextBillingDate) || other.nextBillingDate == nextBillingDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,amount,currency,billingCycle,billingDay,startDate,nextBillingDate,status,notes,iconUrl,colorHex,createdAt,updatedAt);

@override
String toString() {
  return 'Subscription(id: $id, name: $name, category: $category, amount: $amount, currency: $currency, billingCycle: $billingCycle, billingDay: $billingDay, startDate: $startDate, nextBillingDate: $nextBillingDate, status: $status, notes: $notes, iconUrl: $iconUrl, colorHex: $colorHex, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String category, double amount, String currency, BillingCycle billingCycle, int billingDay, DateTime startDate, DateTime nextBillingDate, SubscriptionStatus status, String? notes, String? iconUrl, String? colorHex, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? amount = null,Object? currency = null,Object? billingCycle = null,Object? billingDay = null,Object? startDate = null,Object? nextBillingDate = null,Object? status = null,Object? notes = freezed,Object? iconUrl = freezed,Object? colorHex = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Subscription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,billingCycle: null == billingCycle ? _self.billingCycle : billingCycle // ignore: cast_nullable_to_non_nullable
as BillingCycle,billingDay: null == billingDay ? _self.billingDay : billingDay // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,nextBillingDate: null == nextBillingDate ? _self.nextBillingDate : nextBillingDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SubscriptionStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,colorHex: freezed == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
