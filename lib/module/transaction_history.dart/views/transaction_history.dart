import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/config/extensions/spacing_extensions.dart';
import 'package:task/config/key/app_keys.dart';
import 'package:task/core/shared/transaction_model.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_history_bloc.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_history_event.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_histroy_state.dart';
import 'package:task/module/transaction_history.dart/widgets/custom_bar_chart.dart';
import 'package:task/module/transaction_history.dart/widgets/transaction_with_date.dart';

class TransactionHistoryPage extends HookWidget {
  TransactionHistoryPage({super.key});
  final List<int> dates = List.generate(10, (index) => index + 1);
  final List<int> values = List.generate(10, (index) => Random().nextInt(100));

  ini() async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(AppKeys.walletKey, "2000");
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      ini();
      context.read<TransactionHistoryBloc>().add(TransactionHistoryEventInit());
      return () {
        debugPrint("Dispose");
      };
    }, []);
    return RefreshIndicator(
      onRefresh: () async {
        context
            .read<TransactionHistoryBloc>()
            .add(TransactionHistoryEventInit());
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<TransactionHistoryBloc, TransactionHistroyState>(
                buildWhen: (current, previous) =>
                    current is TransactionHistoryLoadingData,
                builder: (context, state) {
                  if (state is TransactionHistoryLoadingData) {
                    return Text(
                      "xx-xx",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ).addPadding(vertical: 12).center();
                  }
                  if (state is TransactionHistoryError) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ).addPadding(vertical: 12).center();
                  }
                  if (state is TransactionHistoryLoadedData) {
                    return Text(
                      "£${(double.parse(state.amount) - state.transactionModelArray.fold(0.0, (sum, toElement) => sum + toElement.amount)).toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ).addPadding(vertical: 12).center();
                  }
                  return Text(
                    "xx-xx",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ).addPadding(vertical: 12).center();
                }),
            BlocBuilder<TransactionHistoryBloc, TransactionHistroyState>(
                builder: (context, state) {
              if (state is TransactionHistoryLoadingData) {
                return SizedBox.shrink();
              }
              if (state is TransactionHistoryError) {
                return Text(state.errorMessage);
              }
              if (state is TransactionHistoryLoadedData) {
                return CustomBarChart(
                  transactions: state.transactionModelArray,
                );
              }
              return SizedBox.shrink();
            }),
            20.height,
            BlocBuilder<TransactionHistoryBloc, TransactionHistroyState>(
                // buildWhen: (previous, current) => ,
                builder: (context, state) {
              if (state is TransactionHistoryLoadingData) {
                return LinearProgressIndicator();
              }
              if (state is TransactionHistoryError) {
                return Text(state.errorMessage);
              }
              if (state is TransactionHistoryLoadedData) {
                final transactions = state.transactionModelArray;

                // Get today's and yesterday's date
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final yesterday = today.subtract(Duration(days: 1));

                List<TransactionModel> yesterdayTransactions = [];
                List<TransactionModel> restTransactions = [];

                for (var transaction in transactions) {
                  final transactionDate = DateTime.parse(
                      transaction.date); // Convert string to DateTime
                  final formattedDate = DateTime(transactionDate.year,
                      transactionDate.month, transactionDate.day);

                  if (formattedDate == yesterday) {
                    yesterdayTransactions.add(transaction);
                  } else {
                    restTransactions.add(transaction);
                  }
                }

                // 🔹 Sort 'Rest' transactions in descending order (newest first)
                restTransactions.sort((a, b) =>
                    DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));

                return Column(
                  children: [
                    if (yesterdayTransactions.isNotEmpty)
                      TransactionWithDate(
                        "Yesterday",
                        yesterdayTransactions,
                      ),
                    if (restTransactions.isNotEmpty)
                      TransactionWithDate(
                        "Rest",
                        restTransactions.reversed.toList(),
                      ),
                  ],
                );
              }
              return LinearProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}
