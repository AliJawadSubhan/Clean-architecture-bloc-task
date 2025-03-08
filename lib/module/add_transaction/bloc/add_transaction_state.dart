class AddTransactionState {}

class AddTransactionDropDownState extends AddTransactionState {
  bool isDropDownOpen = false;
  AddTransactionDropDownState({required this.isDropDownOpen});
}

class AddTransactionSubmitLoading extends AddTransactionState {}

class AddTransactionSubmitError extends AddTransactionState {
  final String error;

  AddTransactionSubmitError(this.error);
}

class AddTransactionSubmitSuccess extends AddTransactionState {}
