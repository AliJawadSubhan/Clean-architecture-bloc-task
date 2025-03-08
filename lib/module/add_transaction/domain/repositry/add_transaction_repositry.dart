import 'package:task/core/shared/transaction_model.dart';

abstract class AddTransactionRepositry {
  Future<(bool, String?)> addTransaction(TransactionModel t);
}
