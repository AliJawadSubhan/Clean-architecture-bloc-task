import 'package:task/core/shared/transaction_model.dart';
import 'package:task/module/transaction_history.dart/domain/repositry/transaction_history_repositry.dart';
import 'package:task/module/transaction_history.dart/domain/source/transaction_history_source.dart';

class TransactionHistoryUsecase extends TransactionHistoryRepositry {
  @override
  Future<(String?, List<TransactionModel>)> getTransactionModel() async {
    try {
      final source = TransactionHistorySource();
      final response = await source.getTransactionList();
      if (response.isEmpty) {
        return ("No Transactions were found!", <TransactionModel>[]);
      } else {
        List<TransactionModel> t = [];
        for (var element in response) {
          t.add(TransactionModel.fromMap(element));
        }
        return (null, t);
      }
    } catch (e) {
      return ("$e", <TransactionModel>[]);
    }
  }

  @override
  Future<String?> walletAmount() async {
    try {
      final source = TransactionHistorySource();
      final response = await source.getWalletAmount();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
