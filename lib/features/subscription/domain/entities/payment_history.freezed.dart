// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentHistory {
  int get id => throw _privateConstructorUsedError;
  int get subscriptionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get paidAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentHistoryCopyWith<PaymentHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryCopyWith<$Res> {
  factory $PaymentHistoryCopyWith(
          PaymentHistory value, $Res Function(PaymentHistory) then) =
      _$PaymentHistoryCopyWithImpl<$Res, PaymentHistory>;
  @useResult
  $Res call(
      {int id,
      int subscriptionId,
      double amount,
      String currency,
      DateTime paidAt,
      String? notes});
}

/// @nodoc
class _$PaymentHistoryCopyWithImpl<$Res, $Val extends PaymentHistory>
    implements $PaymentHistoryCopyWith<$Res> {
  _$PaymentHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paidAt = null,
    Object? notes = freezed,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentHistoryImplCopyWith<$Res>
    implements $PaymentHistoryCopyWith<$Res> {
  factory _$$PaymentHistoryImplCopyWith(_$PaymentHistoryImpl value,
          $Res Function(_$PaymentHistoryImpl) then) =
      __$$PaymentHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int subscriptionId,
      double amount,
      String currency,
      DateTime paidAt,
      String? notes});
}

/// @nodoc
class __$$PaymentHistoryImplCopyWithImpl<$Res>
    extends _$PaymentHistoryCopyWithImpl<$Res, _$PaymentHistoryImpl>
    implements _$$PaymentHistoryImplCopyWith<$Res> {
  __$$PaymentHistoryImplCopyWithImpl(
      _$PaymentHistoryImpl _value, $Res Function(_$PaymentHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subscriptionId = null,
    Object? amount = null,
    Object? currency = null,
    Object? paidAt = null,
    Object? notes = freezed,
  }) {
    return _then(_$PaymentHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      subscriptionId: null == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paidAt: null == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PaymentHistoryImpl extends _PaymentHistory {
  const _$PaymentHistoryImpl(
      {required this.id,
      required this.subscriptionId,
      required this.amount,
      required this.currency,
      required this.paidAt,
      this.notes})
      : super._();

  @override
  final int id;
  @override
  final int subscriptionId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  final DateTime paidAt;
  @override
  final String? notes;

  @override
  String toString() {
    return 'PaymentHistory(id: $id, subscriptionId: $subscriptionId, amount: $amount, currency: $currency, paidAt: $paidAt, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, subscriptionId, amount, currency, paidAt, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryImplCopyWith<_$PaymentHistoryImpl> get copyWith =>
      __$$PaymentHistoryImplCopyWithImpl<_$PaymentHistoryImpl>(
          this, _$identity);
}

abstract class _PaymentHistory extends PaymentHistory {
  const factory _PaymentHistory(
      {required final int id,
      required final int subscriptionId,
      required final double amount,
      required final String currency,
      required final DateTime paidAt,
      final String? notes}) = _$PaymentHistoryImpl;
  const _PaymentHistory._() : super._();

  @override
  int get id;
  @override
  int get subscriptionId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  DateTime get paidAt;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$PaymentHistoryImplCopyWith<_$PaymentHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
