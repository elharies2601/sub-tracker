class AddPaymentState {
  final int resultSave;
  final String msgError;
  final bool isDone;

  AddPaymentState({this.resultSave = -1, this.msgError = "", this.isDone = false});

  AddPaymentState copy({
    int? resultSave,
    String? msgError,
    bool? isDone
  }) {
    return AddPaymentState(
      resultSave: resultSave ?? this.resultSave,
      msgError: msgError ?? this.msgError,
      isDone: isDone ?? this.isDone
    );
  }
}