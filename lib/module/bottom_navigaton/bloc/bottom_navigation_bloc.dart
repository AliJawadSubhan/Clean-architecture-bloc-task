// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_event.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc(super.initialState) {
    on<BottomNavigationChangeIndex>((event, emit) {
      emit(BottomNavigationIndexState(event.index));
    });
  }
}
