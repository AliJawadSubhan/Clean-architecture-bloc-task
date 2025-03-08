import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_history_event.dart';
import 'package:task/module/transaction_history.dart/bloc/transaction_histroy_state.dart';
import 'package:task/module/transaction_history.dart/domain/repositry/transaction_history_repositry.dart';
import 'package:task/module/transaction_history.dart/domain/usecase/transaction_history_usecase.dart';

class TransactionHistoryBloc
    extends Bloc<TransactionHistoryEvent, TransactionHistroyState> {
  TransactionHistoryBloc(super.initialState) {
    on<TransactionHistoryEventInit>(
      (event, emit) async {
        try {
          emit(TransactionHistoryLoadingData());
          final TransactionHistoryRepositry _rep = TransactionHistoryUsecase();
          // 2 second
          //  future,wait([
          // ])
          // 2 second
          final (erroMessage, data) = await _rep.getTransactionModel();
          final String? amount = await _rep.walletAmount();
          if (amount == null) {
            emit(TransactionHistoryError("Amount Not Found!"));
            return;
          }
          if (erroMessage != null) {
            emit(TransactionHistoryError(erroMessage));
          } else {
            emit(TransactionHistoryLoadedData(data, amount));
          }
        } catch (e) {
          emit(TransactionHistoryError(e.toString()));
        }
      },
    );
  }
  // TransactionHistoryBloc() : super(  TransactionHistoryBloc());
}
