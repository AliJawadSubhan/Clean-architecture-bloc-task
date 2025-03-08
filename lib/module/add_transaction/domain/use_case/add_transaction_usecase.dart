import 'package:task/core/shared/transaction_model.dart';
import 'package:task/module/add_transaction/domain/repositry/add_transaction_repositry.dart';
import 'package:task/module/add_transaction/domain/source/add_transaction_local_source.dart';

class AddTransactionUsecase extends AddTransactionRepositry {
  @override
  Future<(bool, String?)> addTransaction(TransactionModel t) async {
    try {
      final source = AddTransactionLocalSource();
      final response = await source.saveTransaction(t);
      return (response, response ? "Transaction saved successfully" : null);
    } catch (e) {
      return (false, e.toString());
    }
  }
}
