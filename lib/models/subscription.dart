import 'dart:convert';

import 'package:collection/collection.dart';

import '../helper/constants/const_status_subscription.dart';

class Subscription {
  int? id;
  String? serviceName;
  double cost;
  String billingCycle;
  String startPaymentDate;
  String? latestPaymentDate;
  String? nextPaymentDate;
  String status;
  String createdAt;
  String? updatedAt;
  int? categoryId;
  String? categoryName;

  Subscription(
      {this.id,
      this.serviceName,
      required this.cost,
      required this.billingCycle,
      required this.startPaymentDate,
      required this.createdAt,
      this.status = ConstStatusSubscription.active,
      this.nextPaymentDate,
      this.latestPaymentDate,
      this.updatedAt,
      this.categoryId,
      this.categoryName});

  @override
  String toString() {
    return 'Subscription(id: $id, serviceName: $serviceName, '
        'cost: $cost, billingCycle: $billingCycle, nextPaymentDate: $nextPaymentDate, '
        'createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, '
        'categoryName: $categoryName, status: $status, startPaymentDate: $startPaymentDate, latestPaymentDate: $latestPaymentDate)';
  }

  factory Subscription.fromMap(Map<String, dynamic> data) => Subscription(
      id: data['id'] as int?,
      serviceName: data['service_name'] as String?,
      cost: data['cost'] as double,
      billingCycle: data['billing_cycle'] as String,
      startPaymentDate: data['start_payment_date'] as String,
      nextPaymentDate: data['next_payment_date'] as String?,
      latestPaymentDate: data['latest_payment_date'] as String?,
      status: data['status'] as String,
      createdAt: data['created_at'] as String,
      updatedAt: data['updated_at'] as String?,
      categoryId: data['category_id'] as int?,
      categoryName:
          data['categoryName'] == null ? "" : data['categoryName'] as String?);

  Map<String, dynamic> toMap() => {
        'id': id,
        'service_name': serviceName,
        'cost': cost,
        'billing_cycle': billingCycle,
        'next_payment_date': nextPaymentDate,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'category_id': categoryId,
        'status': status,
        'start_payment_date': startPaymentDate,
        'latest_payment_date': latestPaymentDate
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Subscription].
  factory Subscription.fromJson(String data) {
    return Subscription.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Subscription] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Subscription) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  Subscription copyWith(
      {int? id,
      String? serviceName,
      required double cost,
      required String billingCycle,
      required String startPaymentDate,
      String? latestPaymentDate,
      String? nextPaymentDate,
      required String createdAt,
      String? status,
      String? updatedAt,
      int? categoryId,
      String? categoryName}) {
    return Subscription(
      id: id ?? this.id,
      serviceName: serviceName ?? this.serviceName,
      cost: cost,
      billingCycle: billingCycle,
      nextPaymentDate: nextPaymentDate ?? this.nextPaymentDate,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      status: status ?? this.status,
      startPaymentDate: startPaymentDate,
      latestPaymentDate: latestPaymentDate ?? this.latestPaymentDate,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^
      serviceName.hashCode ^
      cost.hashCode ^
      billingCycle.hashCode ^
      nextPaymentDate.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      categoryId.hashCode ^
      categoryName.hashCode ^
      status.hashCode ^
      startPaymentDate.hashCode ^
      latestPaymentDate.hashCode;
}
