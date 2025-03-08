import 'package:task/core/shared/transaction_model.dart';

class TransactionHistroyState {}

class TransactionHistoryLoadingData extends TransactionHistroyState {}

class TransactionHistoryLoadedData extends TransactionHistroyState {
  final List<TransactionModel> transactionModelArray;
  final String amount;

  TransactionHistoryLoadedData(this.transactionModelArray, this.amount);
}

class TransactionHistoryError extends TransactionHistroyState {
  final String errorMessage;

  TransactionHistoryError(this.errorMessage);
}
