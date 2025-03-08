import 'package:task/core/shared/transaction_model.dart';

class AddTransactionEvent {}

class AddTransactionDropDownEvent extends AddTransactionEvent {
  final bool action;
  AddTransactionDropDownEvent(this.action);
}

class AddTransactionEventSubmit extends AddTransactionEvent {
  final TransactionModel transactionModel;

  AddTransactionEventSubmit(this.transactionModel);
}
