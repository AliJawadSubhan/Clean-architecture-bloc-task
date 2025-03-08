import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/config/router/route_config.dart';
import 'package:task/module/add_transaction/bloc/add_transacstion_bloc.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_state.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_bloc.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_state.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_history_bloc.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_histroy_state.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(BottomNavigationState()),
        ),
        BlocProvider<AddTransacstionBloc>(
          create: (context) => AddTransacstionBloc(AddTransactionState()),
        ),
        BlocProvider<TransactionHistoryBloc>(
          create: (context) =>
              TransactionHistoryBloc(TransactionHistroyState()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
