import 'package:flutter/material.dart'
    show
        GlobalKey,
        NavigatorObserver,
        NavigatorState,
        Route,
        SizedBox,
        debugPrint;
import 'package:go_router/go_router.dart';
import 'package:task/module/add_transaction/view/add_transaction.dart';
import 'package:task/module/bottom_navigaton/children/home.dart';
import 'package:task/module/bottom_navigaton/view/bottom_navigation_page.dart';
import 'package:task/module/transaction_history.dart/views/transaction_history.dart';

final _shellKey = GlobalKey<NavigatorState>();
final GoRouter router = GoRouter(
  navigatorKey: _shellKey,
  initialLocation: '/transaction',
  routes: [
    ShellRoute(
      navigatorKey: _shellKey,
      builder: (context, state, child) {
        return BottomNavigationPage();
      },
      routes: [
        GoRoute(
          path: '/bottom',
          builder: (context, state) => TransactionHistoryPage(),
        ),
        GoRoute(path: '/transaction', builder: (context, state) => HomePage()),
        GoRoute(
          path: '/wallet',
          builder: (context, state) => const SizedBox(),
        ),
        GoRoute(
            path: '/settings', builder: (context, state) => const SizedBox()),
      ],
    ),
    GoRoute(
      path: '/add-transaction',
      builder: (context, state) => AddTransactionPage(),
    ),
  ],
);

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(
        'Navigation: pushed to ${route.settings.name} ${route.toString()}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint(
        'Navigation: popped from ${route.settings.name} ${route.toString()}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint(
        'Navigation: replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name} ${newRoute.toString()}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint(
        'Navigation: removed ${route.settings.name} ${route.toString()}');
  }
}
