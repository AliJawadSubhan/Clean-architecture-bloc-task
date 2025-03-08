import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:task/core/colors/colors.dart';
import 'package:task/config/extensions/spacing_extensions.dart';
import 'package:task/core/shared/transaction_model.dart';
import 'package:task/core/utility/custom_snackbars.dart';
import 'package:task/core/utility/date_helper.dart';
import 'package:task/core/utility/widgets/custom_textfield.dart';
import 'package:task/module/add_transaction/bloc/add_transacstion_bloc.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_event.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_state.dart';
import 'package:task/module/add_transaction/domain/source/add_transaction_local_source.dart';
import 'package:task/module/add_transaction/static/add_transaction_static.dart';
import 'package:task/module/add_transaction/widgets/custom_Drop_Down.dart';

class AddTransactionPage extends HookWidget {
  AddTransactionPage({super.key});

  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final TextEditingController amountController =
      TextEditingController(text: '£0.00');
  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AddTransacstionBloc>().add(
            AddTransactionDropDownEvent(false),
          );
      // AddTransactionLocalSource()
      //     .saveTransactionList(AddTransactionStatic.transactions);
      // wanted to add widgets
      // context
      //     .read<BottomNavigationBloc>()
      //     .add(BottomNavigationInit(StaticBottomNavigation.widgets));
      return () {
        debugPrint("Dispose");

        amountController.dispose();
        noteController.dispose();
      };
    }, []);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        height: 65,
        color: Colors.transparent,
        padding: EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () {
            TransactionModel transactionModel = TransactionModel(
              description: noteController.text,
              amount: int.parse(amountController.text),
              label: context.read<AddTransacstionBloc>().selectedLabel,
              date: DateTime.now().toString(),
            );
            context
                .read<AddTransacstionBloc>()
                .add(AddTransactionEventSubmit(transactionModel));
          },
          child: BlocBuilder<AddTransacstionBloc, AddTransactionState>(
              buildWhen: (previous, current) =>
                  current is AddTransactionSubmitLoading ||
                  current is AddTransactionSubmitError ||
                  current is AddTransactionSubmitSuccess,
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryPinkColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: state is AddTransactionSubmitLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text("Add"),
                );
              }),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              12.height,
              BlocListener<AddTransacstionBloc, AddTransactionState>(
                  listenWhen: (previous, current) =>
                      current is AddTransactionSubmitError ||
                      current is AddTransactionSubmitSuccess,
                  listener: (BuildContext context, AddTransactionState state) {
                    if (state is AddTransactionSubmitError) {
                      showDangerSnackBar(
                        context: context,
                        msg: state.error,
                      );
                    }
                    if (state is AddTransactionSubmitSuccess) {
                      showSuccessSnackBar(
                        context: context,
                        label: "Transaction Added successfully.",
                      );
                    }
                  },
                  child: CustomDropDown(buttonFocusNode: _buttonFocusNode)),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 38,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "£0.00",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ).center(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryGreyColor,
                ),
                child: ListTile(
                  leading: Icon(Icons.calendar_month_outlined),
                  trailing: Text(
                    DateHelper.toHourMinuteAmPm(DateTime.now()),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  title: Text(
                    DateHelper.toDayMonthYear(DateTime.now()),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ).addPadding(horizontal: 8),
              12.height,
              Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryGreyColor,
                ),
                // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: CustomTextField(
                  circularRadius: 12,
                  height: 75,
                  hintText: 'Write a beautiful note.',
                  hintTextColor: Color(0XFF242424),
                  controller: noteController,
                  onChanged: (c) {},
                  maxLines: 12,
                  expands: true,
                  color: AppColors.primaryGreyColor,
                  prefixIcon: Icon(
                    FontAwesome.pencil_solid,
                    size: 12,
                  ),
                ),
              ).addMargin(horizontal: 8),
              12.height,
              ListTile(
                leading: Icon(Icons.label_important_outline_sharp),
                trailing: Icon(Icons.arrow_forward),
                title: Text(
                  "Labels",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: 14,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.primaryGreyColor,
                      ),
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Labels",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ).addPadding(vertical: 1, horizontal: 7);
                  },
                ),
              ),
              12.height,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primaryGreyColor,
                ),
                child: ListTile(
                  leading: Icon(Icons.repeat),
                  trailing: Text(
                    "Never",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  title: Text(
                    "Recurrance",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ).addPadding(horizontal: 8),
            ],
          ),
        ),
      ),
    );
  }
}
