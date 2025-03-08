import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:task/config/extensions/spacing_extensions.dart';
import 'package:task/core/utility/custom_snackbars.dart';
import 'package:task/module/add_transaction/bloc/add_transacstion_bloc.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_event.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_state.dart';
import 'package:task/module/add_transaction/static/add_transaction_static.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required FocusNode buttonFocusNode,
  }) : _buttonFocusNode = buttonFocusNode;

  final FocusNode _buttonFocusNode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: MenuAnchor(
                alignmentOffset: Offset(6, -6),
                style: MenuStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  elevation: WidgetStatePropertyAll(0),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.all(12),
                  ),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (o) {
                      return Color(0xFFE0ECFF);
                    },
                  ),
                ),
                crossAxisUnconstrained: false,
                menuChildren: [
                  8.height,
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: List.generate(
                        (AddTransactionStatic.menuItems.length / 2).ceil(),
                        (rowIndex) {
                          int firstIndex = rowIndex * 2;
                          int secondIndex = firstIndex + 1;

                          return Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        context
                                            .read<AddTransacstionBloc>()
                                            .selectLabel(AddTransactionStatic
                                                .menuItems[firstIndex]);

                                        showSuccessSnackBar(
                                            context: context,
                                            label:
                                                "${context.read<AddTransacstionBloc>().selectedLabel} Selected");
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          // tile color: get random color
                                          color: AddTransactionStatic.tileColor[
                                              firstIndex %
                                                  AddTransactionStatic
                                                      .tileColor.length],
                                          border: Border.all(
                                            color: Color(0XffB2C3DE),
                                          ),
                                        ),
                                        padding: EdgeInsets.all(12),
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesome.basket_shopping_solid,
                                              size: 14,
                                            ),
                                            8.width,
                                            Text(
                                              AddTransactionStatic
                                                  .menuItems[firstIndex],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (secondIndex <
                                    AddTransactionStatic.menuItems.length)
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context
                                              .read<AddTransacstionBloc>()
                                              .selectLabel(
                                                AddTransactionStatic
                                                    .menuItems[secondIndex],
                                              );
                                          showSuccessSnackBar(
                                              context: context,
                                              label:
                                                  "${context.read<AddTransacstionBloc>().selectedLabel} Selected");
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(21),
                                            color:
                                                AddTransactionStatic.tileColor[
                                                    firstIndex %
                                                        AddTransactionStatic
                                                            .tileColor.length],
                                            border: Border.all(
                                              color: Color(0XffB2C3DE),
                                            ),
                                          ),
                                          padding: EdgeInsets.all(12),
                                          child: Row(
                                            children: [
                                              Icon(
                                                FontAwesome
                                                    .basket_shopping_solid,
                                                size: 14,
                                              ),
                                              8.width,
                                              Text(
                                                AddTransactionStatic
                                                    .menuItems[secondIndex],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  Expanded(
                                      child:
                                          SizedBox()), // Keeps alignment for odd items
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
                childFocusNode: _buttonFocusNode,
                builder: (
                  context,
                  controller,
                  child,
                ) {
                  return BlocBuilder<AddTransacstionBloc, AddTransactionState>(
                      builder: (c, s) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(
                              s is AddTransactionDropDownState &&
                                      !s.isDropDownOpen
                                  ? 12
                                  : 0,
                            ),
                            bottomRight: Radius.circular(
                              s is AddTransactionDropDownState &&
                                      !s.isDropDownOpen
                                  ? 12
                                  : 0,
                            )),
                        color: Color(0xFFE0ECFF),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Icon(FontAwesome.basket_shopping_solid),
                          ),
                          // 4.width,
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Shopping",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                if (controller.isOpen) {
                                  context
                                      .read<AddTransacstionBloc>()
                                      .add(AddTransactionDropDownEvent(
                                        false,
                                      ));
                                  controller.close();
                                } else {
                                  context
                                      .read<AddTransacstionBloc>()
                                      .add(AddTransactionDropDownEvent(true));
                                  controller.open();
                                }
                              },
                              child: controller.isOpen
                                  ? Icon(Icons.arrow_drop_up)
                                  : Icon(Icons.arrow_drop_down),
                            ),
                          )
                        ],
                      ),
                    ).addPadding(overall: 6);
                  });
                }),
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, setState) {
              return BlocBuilder<AddTransacstionBloc, AddTransactionState>(
                buildWhen: (previous, current) =>
                    current is AddTransactionDropDownState,
                builder: (context, state) {
                  debugPrint(
                      "${state is AddTransactionDropDownState && state.isDropDownOpen} Current Value");
                  return Column(
                    mainAxisAlignment: state is AddTransactionDropDownState &&
                            state.isDropDownOpen
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: state is AddTransactionDropDownState &&
                                    state.isDropDownOpen
                                ? 4
                                : 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0XffDBFFDB),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Icon(
                                  FontAwesome.piggy_bank_solid,
                                  size: 12,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Cash",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              )
                            ],
                          ),
                        ).addPadding(overall: 6),
                      ),
                    ],
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
