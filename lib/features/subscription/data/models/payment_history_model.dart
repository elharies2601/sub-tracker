import 'package:isar_community/isar.dart';

import '../../domain/entities/payment_history.dart' as entity;

part 'payment_history_model.g.dart';

@collection
class PaymentHistoryModel {
  Id id = Isar.autoIncrement;

  late int subscriptionId;
  late double amount;
  late String currency;
  late DateTime paidAt;
  String? notes;

  @Index()
  int get paidAtYear => paidAt.year;
  int get paidAtMonth => paidAt.month;

  entity.PaymentHistory toEntity() => entity.PaymentHistory(
    id: id,
    subscriptionId: subscriptionId,
    amount: amount,
    currency: currency,
    paidAt: paidAt,
    notes: notes,
  );

  static PaymentHistoryModel fromEntity(entity.PaymentHistory e) =>
      PaymentHistoryModel()
        ..id = e.id == 0 ? Isar.autoIncrement : e.id
        ..subscriptionId = e.subscriptionId
        ..amount = e.amount
        ..currency = e.currency
        ..paidAt = e.paidAt
        ..notes = e.notes;
}
