import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/config/key/app_keys.dart';
import 'package:task/core/shared/transaction_model.dart';

class AddTransactionLocalSource {
  Future<bool> saveTransaction(TransactionModel transaction) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> transactions =
          prefs.getStringList(AppKeys.transactionsKey) ?? [];
      transactions.add(jsonEncode(transaction.toMap()));
      await prefs.setStringList(AppKeys.transactionsKey, transactions);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Future<bool> saveTransactionList(List<TransactionModel> transaction) async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setStringList(
  //         AppKeys.transactionsKey,
  //         transaction.map((e) {
  //           return jsonEncode(e.toMap());
  //         }).toList());
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
