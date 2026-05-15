import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_history.freezed.dart';

@freezed
class PaymentHistory with _$PaymentHistory {
  const PaymentHistory._();

  const factory PaymentHistory({
    required int id,
    required int subscriptionId,
    required double amount,
    required String currency,
    required DateTime paidAt,
    String? notes,
  }) = _PaymentHistory;

  /// Month label for grouping: "Apr 2026"
  String get monthLabel {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[paidAt.month - 1]} ${paidAt.year}';
  }
}
