import 'package:flutter/material.dart';
import 'package:task/core/shared/transaction_model.dart';

class AddTransactionStatic {
  static List<String> menuItems = [
    "Food & Drink",
    "Transport",
    "Lifestyle",
    "Health",
    "Education",
    "Apparel",
    "Gifts",
    "Internet",
    "Shopping",
    "Charity",
    "Pets",
    "Social Life",
    "Phone",
    "Fun"
  ];
  static List tileColor = [
    Color(0xFFE0F7EC),
    Color(0XffE4E6FF),
    Color(0xFFF0E6EB),
    Color(0XffC9DDFC),
    Color(0xFFF0EFDB)
  ];

  static List<TransactionModel> transactions = [
    TransactionModel(
        description: "Groceries",
        amount: 15.99,
        label: "Food",
        date: DateTime(2025, 3, 1).toIso8601String()),
    TransactionModel(
        description: "Gym Membership",
        amount: 30.00,
        label: "Fitness",
        date: DateTime(2025, 3, 2).toIso8601String()),
    TransactionModel(
        description: "Netflix Subscription",
        amount: 12.99,
        label: "Entertainment",
        date: DateTime(2025, 3, 3).toIso8601String()),
    TransactionModel(
        description: "Coffee",
        amount: 4.50,
        label: "Food",
        date: DateTime(2025, 3, 4).toIso8601String()),
    TransactionModel(
        description: "Electricity Bill",
        amount: 60.75,
        label: "Utilities",
        date: DateTime(2025, 3, 5).toIso8601String()),
    TransactionModel(
        description: "Dinner Out",
        amount: 45.00,
        label: "Food",
        date: DateTime(2025, 3, 6).toIso8601String()),
    TransactionModel(
        description: "Movie Tickets",
        amount: 20.00,
        label: "Entertainment",
        date: DateTime(2025, 3, 7).toIso8601String()),
    TransactionModel(
        description: "Bus Fare",
        amount: 2.50,
        label: "Transport",
        date: DateTime(2025, 3, 8).toIso8601String()),
    TransactionModel(
        description: "Water Bill",
        amount: 25.99,
        label: "Utilities",
        date: DateTime(2025, 3, 9).toIso8601String()),
    TransactionModel(
        description: "Phone Recharge",
        amount: 10.00,
        label: "Communication",
        date: DateTime(2025, 3, 10).toIso8601String()),
    TransactionModel(
        description: "Shopping",
        amount: 75.00,
        label: "Personal",
        date: DateTime(2025, 3, 11).toIso8601String()),
    TransactionModel(
        description: "Lunch",
        amount: 20.50,
        label: "Food",
        date: DateTime(2025, 3, 12).toIso8601String()),
    TransactionModel(
        description: "Internet Bill",
        amount: 50.00,
        label: "Utilities",
        date: DateTime(2025, 3, 13).toIso8601String()),
    TransactionModel(
        description: "Train Ticket",
        amount: 15.00,
        label: "Transport",
        date: DateTime(2025, 3, 14).toIso8601String()),
    TransactionModel(
        description: "New Shoes",
        amount: 120.00,
        label: "Personal",
        date: DateTime(2025, 3, 15).toIso8601String()),
    TransactionModel(
        description: "Car Wash",
        amount: 18.00,
        label: "Automobile",
        date: DateTime(2025, 3, 16).toIso8601String()),
    TransactionModel(
        description: "Gym Supplement",
        amount: 35.00,
        label: "Fitness",
        date: DateTime(2025, 3, 17).toIso8601String()),
    TransactionModel(
        description: "Medical Checkup",
        amount: 100.00,
        label: "Health",
        date: DateTime(2025, 3, 18).toIso8601String()),
    TransactionModel(
        description: "Fast Food",
        amount: 15.00,
        label: "Food",
        date: DateTime(2025, 3, 19).toIso8601String()),
    TransactionModel(
        description: "Petrol",
        amount: 50.00,
        label: "Automobile",
        date: DateTime(2025, 3, 20).toIso8601String()),
    TransactionModel(
        description: "Gift for Friend",
        amount: 40.00,
        label: "Personal",
        date: DateTime(2025, 3, 21).toIso8601String()),
    TransactionModel(
        description: "Home Repairs",
        amount: 75.00,
        label: "Home",
        date: DateTime(2025, 3, 22).toIso8601String()),
    TransactionModel(
        description: "Concert Ticket",
        amount: 90.00,
        label: "Entertainment",
        date: DateTime(2025, 3, 23).toIso8601String()),
    TransactionModel(
        description: "Dinner at Restaurant",
        amount: 65.00,
        label: "Food",
        date: DateTime(2025, 3, 24).toIso8601String()),
    TransactionModel(
        description: "Coffee with Friends",
        amount: 8.50,
        label: "Food",
        date: DateTime(2025, 3, 25).toIso8601String()),
    TransactionModel(
        description: "Uber Ride",
        amount: 22.00,
        label: "Transport",
        date: DateTime(2025, 3, 26).toIso8601String()),
    TransactionModel(
        description: "Shopping for Clothes",
        amount: 110.00,
        label: "Personal",
        date: DateTime(2025, 3, 27).toIso8601String()),
    TransactionModel(
        description: "Monthly Subscription",
        amount: 9.99,
        label: "Entertainment",
        date: DateTime(2025, 3, 28).toIso8601String()),
    TransactionModel(
        description: "Bike Repair",
        amount: 45.00,
        label: "Automobile",
        date: DateTime(2025, 3, 29).toIso8601String()),
    TransactionModel(
        description: "Weekend Getaway",
        amount: 200.00,
        label: "Entertainment",
        date: DateTime(2025, 3, 30).toIso8601String()),
    TransactionModel(
        description: "Online Course",
        amount: 80.00,
        label: "Education",
        date: DateTime(
          2025,
          3,
          31,
        ).toIso8601String()),
  ];
}
