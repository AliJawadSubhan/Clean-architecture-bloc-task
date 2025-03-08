import 'package:flutter/material.dart';

void showSuccessSnackBar({
  String label = "Success",
  int duration = 2,
  required BuildContext context,
}) {
  // int maxLength = 40;

  final snackBar = SnackBar(
    content: Text(
      label,
      style: const TextStyle(color: Colors.white, fontFamily: 'Outfit'),
    ),
    backgroundColor: Colors.green,
    duration: Duration(seconds: duration),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showDangerSnackBar({
  String? msg,
  int duration = 2,
  Color bgColor = Colors.red,
  required BuildContext context,
}) {
  final snackBar = SnackBar(
    content: Text(
      msg ?? "Error",
      style: const TextStyle(color: Colors.white, fontFamily: 'Outfit'),
    ),
    backgroundColor: bgColor,
    duration: Duration(seconds: duration),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
