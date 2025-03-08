import 'package:task/core/shared/transaction_model.dart';

abstract class TransactionHistoryRepositry {
  Future<(String?, List<TransactionModel>)> getTransactionModel();
  Future<String?> walletAmount();
}
