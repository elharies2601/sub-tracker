// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Subscription {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  BillingCycle get billingCycle => throw _privateConstructorUsedError;
  int get billingDay =>
      throw _privateConstructorUsedError; // day of month/week billing occurs
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get nextBillingDate => throw _privateConstructorUsedError;
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get colorHex => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
          Subscription value, $Res Function(Subscription) then) =
      _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      double amount,
      String currency,
      BillingCycle billingCycle,
      int billingDay,
      DateTime startDate,
      DateTime nextBillingDate,
      SubscriptionStatus status,
      String? notes,
      String? iconUrl,
      String? colorHex,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? amount = null,
    Object? currency = null,
    Object? billingCycle = null,
    Object? billingDay = null,
    Object? startDate = null,
    Object? nextBillingDate = null,
    Object? status = null,
    Object? notes = freezed,
    Object? iconUrl = freezed,
    Object? colorHex = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      billingCycle: null == billingCycle
          ? _value.billingCycle
          : billingCycle // ignore: cast_nullable_to_non_nullable
              as BillingCycle,
      billingDay: null == billingDay
          ? _value.billingDay
          : billingDay // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextBillingDate: null == nextBillingDate
          ? _value.nextBillingDate
          : nextBillingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
          _$SubscriptionImpl value, $Res Function(_$SubscriptionImpl) then) =
      __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      double amount,
      String currency,
      BillingCycle billingCycle,
      int billingDay,
      DateTime startDate,
      DateTime nextBillingDate,
      SubscriptionStatus status,
      String? notes,
      String? iconUrl,
      String? colorHex,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
      _$SubscriptionImpl _value, $Res Function(_$SubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? amount = null,
    Object? currency = null,
    Object? billingCycle = null,
    Object? billingDay = null,
    Object? startDate = null,
    Object? nextBillingDate = null,
    Object? status = null,
    Object? notes = freezed,
    Object? iconUrl = freezed,
    Object? colorHex = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SubscriptionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      billingCycle: null == billingCycle
          ? _value.billingCycle
          : billingCycle // ignore: cast_nullable_to_non_nullable
              as BillingCycle,
      billingDay: null == billingDay
          ? _value.billingDay
          : billingDay // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nextBillingDate: null == nextBillingDate
          ? _value.nextBillingDate
          : nextBillingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SubscriptionStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      colorHex: freezed == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$SubscriptionImpl extends _Subscription {
  const _$SubscriptionImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.amount,
      required this.currency,
      required this.billingCycle,
      required this.billingDay,
      required this.startDate,
      required this.nextBillingDate,
      this.status = SubscriptionStatus.active,
      this.notes,
      this.iconUrl,
      this.colorHex,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final String category;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final BillingCycle billingCycle;
  @override
  final int billingDay;
// day of month/week billing occurs
  @override
  final DateTime startDate;
  @override
  final DateTime nextBillingDate;
  @override
  @JsonKey()
  final SubscriptionStatus status;
  @override
  final String? notes;
  @override
  final String? iconUrl;
  @override
  final String? colorHex;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Subscription(id: $id, name: $name, category: $category, amount: $amount, currency: $currency, billingCycle: $billingCycle, billingDay: $billingDay, startDate: $startDate, nextBillingDate: $nextBillingDate, status: $status, notes: $notes, iconUrl: $iconUrl, colorHex: $colorHex, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.billingCycle, billingCycle) ||
                other.billingCycle == billingCycle) &&
            (identical(other.billingDay, billingDay) ||
                other.billingDay == billingDay) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.nextBillingDate, nextBillingDate) ||
                other.nextBillingDate == nextBillingDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      category,
      amount,
      currency,
      billingCycle,
      billingDay,
      startDate,
      nextBillingDate,
      status,
      notes,
      iconUrl,
      colorHex,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);
}

abstract class _Subscription extends Subscription {
  const factory _Subscription(
      {required final int id,
      required final String name,
      required final String category,
      required final double amount,
      required final String currency,
      required final BillingCycle billingCycle,
      required final int billingDay,
      required final DateTime startDate,
      required final DateTime nextBillingDate,
      final SubscriptionStatus status,
      final String? notes,
      final String? iconUrl,
      final String? colorHex,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$SubscriptionImpl;
  const _Subscription._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  String get category;
  @override
  double get amount;
  @override
  String get currency;
  @override
  BillingCycle get billingCycle;
  @override
  int get billingDay;
  @override // day of month/week billing occurs
  DateTime get startDate;
  @override
  DateTime get nextBillingDate;
  @override
  SubscriptionStatus get status;
  @override
  String? get notes;
  @override
  String? get iconUrl;
  @override
  String? get colorHex;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
