class AddSubscriptionState {
  final bool isLoading;
  final int resultSave;
  final String msgError;

  AddSubscriptionState({
    this.isLoading = false,
    this.resultSave = -1,
    this.msgError = ""
  });

  AddSubscriptionState copyWith({
    bool? isLoading,
    int? resultSave,
    String? msgError,
  }) {
    return AddSubscriptionState(
      isLoading: isLoading ?? this.isLoading,
      resultSave: resultSave ?? this.resultSave,
      msgError: msgError ?? this.msgError,
    );
  }
}