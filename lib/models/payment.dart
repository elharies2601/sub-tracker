class Payment {
  int? id;
  String paymentDate;
  String? note;
  String createdAt;
  int? idSubscription;

//<editor-fold desc="Data Methods">
  Payment({
    this.id,
    required this.paymentDate,
    this.note,
    required this.createdAt,
    this.idSubscription,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Payment &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          paymentDate == other.paymentDate &&
          note == other.note &&
          createdAt == other.createdAt &&
          idSubscription == other.idSubscription);

  @override
  int get hashCode =>
      id.hashCode ^
      paymentDate.hashCode ^
      note.hashCode ^
      createdAt.hashCode ^
      idSubscription.hashCode;

  @override
  String toString() {
    return 'Payment{ id: $id, paymentDate: $paymentDate, note: $note, createdAt: $createdAt, idSubscription: $idSubscription,}';
  }

  Payment copy({
    int? id,
    String? paymentDate,
    String? note,
    String? createdAt,
    int? idSubscription,
  }) {
    return Payment(
      id: id ?? this.id,
      paymentDate: paymentDate ?? this.paymentDate,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      idSubscription: idSubscription ?? this.idSubscription,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('id'): id,
      keyMapper('payment_date'): paymentDate,
      keyMapper('note'): note,
      keyMapper('created_at'): createdAt,
      keyMapper('id_subscription'): idSubscription,
    };
  }

  factory Payment.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return Payment(
      id: map[keyMapper('id')] as int,
      paymentDate: map[keyMapper('payment_date')] as String,
      note: map[keyMapper('note')] as String?,
      createdAt: map[keyMapper('created_at')] as String,
      idSubscription: map[keyMapper('id_subscription')] as int,
    );
  }

//</editor-fold>
}