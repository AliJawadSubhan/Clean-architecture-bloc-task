import 'package:flutter/material.dart';
import 'package:task/module/bottom_navigaton/children/home.dart';
import 'package:task/module/bottom_navigaton/children/stepper.dart';
import 'package:task/module/bottom_navigaton/children/wallet.dart';
import 'package:task/module/transaction_history.dart/views/transaction_history.dart';

class StaticBottomNavigation {
  static List<String> names = [
    "home",
    "calendar",
    "Add",
    "wallet",
    "steppers",
  ];
  // static List<String> path = [
  //   "/home",
  //   "/transaction",
  //   "/add-transaction",
  //   "/wallet",
  //   "/settinsg",
  // ];
  static List<Widget> widgets = [
    TransactionHistoryPage(),
    HomePage(),
    SizedBox(),
    Wallet(),
    StepperWid(),
  ];
  static List<Color> randomColors = [
    Color(0xFFFFE0D6),
    Color(0xFFB2CDFA),
    Color(0XffFFF1B7),
    Color(0xFFC7FFC7),
    Color(0xffD6C8FF),
    Color(0xFFB5FFF2),
    Color(0XffFFADFC),
    Color(0xFFFFE0A3),
    Color(0xFFFFE0D6),
    Color(0xFFFFE0D6),
  ];
}
