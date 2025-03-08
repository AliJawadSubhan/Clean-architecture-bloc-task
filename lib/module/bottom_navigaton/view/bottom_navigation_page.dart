import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:task/core/colors/colors.dart';
import 'package:task/config/extensions/string_extensions.dart';
import 'package:task/config/router/route_names.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_bloc.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_event.dart';
import 'package:task/module/bottom_navigaton/bloc/bottom_navigation_state.dart';
import 'package:task/module/bottom_navigaton/static/static_bottom_navigation.dart';
import 'package:task/module/bottom_navigaton/widgets/fixed_size_Icon.dart';

class BottomNavigationPage extends HookWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      // wanted to add widgets
      // context
      //     .read<BottomNavigationBloc>()
      //     .add(BottomNavigationInit(StaticBottomNavigation.widgets));
      return () {
        debugPrint("Dispose");
      };
    }, []);
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      bottomNavigationBar: Container(
        color: AppColors.secondaryPinkColor.withOpacity(.1),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: () {
            List<Widget> widgets = [];
            for (int i = 0; i < StaticBottomNavigation.names.length; i++) {
              String element = StaticBottomNavigation.names[i];
              if (element == 'Add') {
                widgets.add(
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        debugPrint('te');
                        context.push(RouteNames.addTransactionPage);
                      },
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.secondaryPinkColor,
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    );
                  }),
                );
              } else {
                widgets.add(Builder(builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        // context.go(element);
                        context
                            .read<BottomNavigationBloc>()
                            .add(BottomNavigationChangeIndex(i));
                      },
                      child: buildFixedSizeIcon(
                          element.toSvg(), Color(0xFF8A8A8A)));
                }));
              }
            }
            return widgets;
          }(),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            if (state is BottomNavigationIndexState) {
              return StaticBottomNavigation.widgets[state.index];
            }
            return StaticBottomNavigation.widgets[0];
          },
        ),
      ),
    );
  }
}
