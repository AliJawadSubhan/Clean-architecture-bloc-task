import 'dart:convert';

import 'package:flutter/material.dart' show debugPrint;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/config/key/app_keys.dart';

class TransactionHistorySource {
  Future<List<Map<String, dynamic>>> getTransactionList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? storedTransactions =
          prefs.getStringList(AppKeys.transactionsKey);

      if (storedTransactions == null || storedTransactions.isEmpty) {
        return [];
      }
      return storedTransactions.map((e) {
        return jsonDecode(e) as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      debugPrint("Error reading transactions: $e");
      rethrow;
    }
  }

  Future<String?> getWalletAmount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final response = prefs.getString(AppKeys.walletKey);
      return response;
    } catch (e) {
      debugPrint("Error reading transactions: $e");
      rethrow;
    }
  }
}
