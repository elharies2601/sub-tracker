import 'package:isar_community/isar.dart';

import '../../domain/entities/subscription.dart' as entity;

part 'subscription_model.g.dart';

/// Isar model — lives ONLY in data layer.
/// Domain entity has NO knowledge of this class.
@collection
class SubscriptionModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String category;
  late double amount;
  late String currency;

  @Enumerated(EnumType.name)
  late BillingCycleDb billingCycle;

  late int billingDay;
  late DateTime startDate;
  @Index()
  late DateTime nextBillingDate;

  @Enumerated(EnumType.name)
  late StatusDb status;

  String? notes;
  String? iconUrl;
  String? colorHex;
  late DateTime createdAt;
  late DateTime updatedAt;

  // ── Mapping: Model → Entity ──────────────────────────────────────

  entity.Subscription toEntity() => entity.Subscription(
    id: id,
    name: name,
    category: category,
    amount: amount,
    currency: currency,
    billingCycle: billingCycle.toEntity(),
    billingDay: billingDay,
    startDate: startDate,
    nextBillingDate: nextBillingDate,
    status: status.toEntity(),
    notes: notes,
    iconUrl: iconUrl,
    colorHex: colorHex,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  // ── Mapping: Entity → Model ──────────────────────────────────────

  static SubscriptionModel fromEntity(entity.Subscription e) {
    return SubscriptionModel()
      ..id = e.id == 0 ? Isar.autoIncrement : e.id
      ..name = e.name
      ..category = e.category
      ..amount = e.amount
      ..currency = e.currency
      ..billingCycle = BillingCycleDbX.fromEntity(e.billingCycle)
      ..billingDay = e.billingDay
      ..startDate = e.startDate
      ..nextBillingDate = e.nextBillingDate
      ..status = StatusDbX.fromEntity(e.status)
      ..notes = e.notes
      ..iconUrl = e.iconUrl
      ..colorHex = e.colorHex
      ..createdAt = e.createdAt
      ..updatedAt = e.updatedAt;
  }
}

// ── Local enums for Isar (EnumType.name serialization) ──────────────

enum BillingCycleDb { weekly, monthly, yearly }

extension BillingCycleDbX on BillingCycleDb {
  entity.BillingCycle toEntity() => switch (this) {
    BillingCycleDb.weekly => entity.BillingCycle.weekly,
    BillingCycleDb.monthly => entity.BillingCycle.monthly,
    BillingCycleDb.yearly => entity.BillingCycle.yearly,
  };

  static BillingCycleDb fromEntity(entity.BillingCycle e) => switch (e) {
    entity.BillingCycle.weekly => BillingCycleDb.weekly,
    entity.BillingCycle.monthly => BillingCycleDb.monthly,
    entity.BillingCycle.yearly => BillingCycleDb.yearly,
  };
}

enum StatusDb { active, paused, cancelled }

extension StatusDbX on StatusDb {
  entity.SubscriptionStatus toEntity() => switch (this) {
    StatusDb.active => entity.SubscriptionStatus.active,
    StatusDb.paused => entity.SubscriptionStatus.paused,
    StatusDb.cancelled => entity.SubscriptionStatus.cancelled,
  };

  static StatusDb fromEntity(entity.SubscriptionStatus e) => switch (e) {
    entity.SubscriptionStatus.active => StatusDb.active,
    entity.SubscriptionStatus.paused => StatusDb.paused,
    entity.SubscriptionStatus.cancelled => StatusDb.cancelled,
  };
}
