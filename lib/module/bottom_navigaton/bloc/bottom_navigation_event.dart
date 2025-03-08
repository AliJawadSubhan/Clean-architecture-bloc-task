import 'package:flutter/material.dart';

class BottomNavigationEvent {}

class BottomNavigationEventInit extends BottomNavigationEvent {}

class BottomNavigationChangeIndex extends BottomNavigationEvent {
  final int index;
  BottomNavigationChangeIndex(this.index);
}

class BottomNavigationInit extends BottomNavigationEvent {
  final List<Widget> widgets;

  BottomNavigationInit(this.widgets);
}
