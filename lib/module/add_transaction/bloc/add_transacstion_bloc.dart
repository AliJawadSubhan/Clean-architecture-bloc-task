import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_event.dart';
import 'package:task/module/add_transaction/bloc/add_transaction_state.dart';
import 'package:task/module/add_transaction/domain/repositry/add_transaction_repositry.dart';
import 'package:task/module/add_transaction/domain/use_case/add_transaction_usecase.dart';

class AddTransacstionBloc
    extends Bloc<AddTransactionEvent, AddTransactionState> {
  String selectedLabel = '';
  selectLabel(String label) {
    selectedLabel = label;
  }

  AddTransacstionBloc(super.initialState) {
    on<AddTransactionDropDownEvent>((event, emit) {
      emit(AddTransactionDropDownState(isDropDownOpen: event.action));
    });
    on<AddTransactionEventSubmit>((event, emit) async {
      try {
        final transaction = event.transactionModel;

        // VALIDATIONS
        if (transaction.description.isEmpty) {
          emit(AddTransactionSubmitError('Kindly write a brief note!'));
          return;
        }

        if (transaction.amount <= 0) {
          emit(AddTransactionSubmitError('Amount must be greater than zero.'));
          return;
        }

        if (transaction.label.isEmpty) {
          emit(AddTransactionSubmitError('Please select a valid category.'));
          return;
        }

        if (transaction.date.isEmpty) {
          emit(AddTransactionSubmitError('Please provide a valid date.'));
          return;
        }
        debugPrint('✅ Transaction Data Validated:');
        debugPrint('Description: ${transaction.description}');
        debugPrint('Amount: ${transaction.amount}');
        debugPrint('Label: ${transaction.label}');
        debugPrint('Date: ${transaction.date}');

        final AddTransactionRepositry transactionRepositry =
            AddTransactionUsecase();
        emit(AddTransactionSubmitLoading());

        final (isSuccess, message) =
            await transactionRepositry.addTransaction(transaction);

        if (isSuccess) {
          emit(AddTransactionSubmitSuccess());
        } else {
          emit(AddTransactionSubmitError(message ?? 'Error occurred.'));
        }
      } catch (e) {
        emit(AddTransactionSubmitError('An unexpected error occurred: $e'));
      }
    });
  }
}
