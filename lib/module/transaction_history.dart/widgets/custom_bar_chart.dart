import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task/config/extensions/spacing_extensions.dart';
import 'package:task/core/shared/transaction_model.dart';
import 'package:task/module/bottom_navigaton/static/static_bottom_navigation.dart';

class CustomBarChart extends StatelessWidget {
  final List<TransactionModel> transactions;

  CustomBarChart({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return Center(child: Text("No transactions available"));
    }

    List<int> uniqueDates = _generateSequentialDates();

    Map<int, double> groupedValues = _groupTransactionsByDate(uniqueDates);

    List<int> values =
        uniqueDates.map((date) => groupedValues[date]?.toInt() ?? 0).toList();

    double totalAmount = transactions.fold(0, (sum, t) => sum + t.amount);

    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(uniqueDates.length, (index) {
                  double percentage = totalAmount == 0
                      ? 0
                      : (values[index] / totalAmount) * 100;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${percentage.toStringAsFixed(1)}%",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        width: 14,
                        height: values[index] * 1.2,
                        decoration: BoxDecoration(
                          color: StaticBottomNavigation.randomColors[index %
                              StaticBottomNavigation.randomColors.length],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Container(
              height: 2,
              color: Color(0XffD9D9D9),
              width: double.infinity,
            ).addPadding(horizontal: 2),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(uniqueDates.length, (index) {
                  return Text(
                    "${uniqueDates[index]}",
                    style: TextStyle(fontSize: 12),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<int> _generateSequentialDates() {
    return [1, 3, 5, 7, 9, 11, 13, 15, 17, 25];
  }

  /// Groups transactions by the randomly selected dates
  Map<int, double> _groupTransactionsByDate(List<int> uniqueDates) {
    Map<int, double> groupedValues = {for (var date in uniqueDates) date: 0.0};

    for (var transaction in transactions) {
      int transactionDay = DateTime.parse(transaction.date).day;
      if (groupedValues.containsKey(transactionDay)) {
        groupedValues[transactionDay] =
            groupedValues[transactionDay]! + transaction.amount;
      }
    }

    return groupedValues;
  }
}
