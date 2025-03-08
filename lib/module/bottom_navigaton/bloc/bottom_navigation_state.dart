import 'package:flutter/material.dart';

class BottomNavigationState {}

class BottomNavigationDataState extends BottomNavigationState {
  final List<Widget> widgets;

  BottomNavigationDataState(this.widgets);
}

class BottomNavigationIndexState extends BottomNavigationState {
  final int index;

  BottomNavigationIndexState(this.index);
}
// class BottomNavigationEventState extends BottomNavigationState {}
