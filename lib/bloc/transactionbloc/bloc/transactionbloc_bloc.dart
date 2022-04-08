import 'package:bloc/bloc.dart';
import 'package:bloc_example/api/apiservices.dart';
import 'package:bloc_example/api/connectivityservice.dart';
import 'package:bloc_example/model/transactionresponse.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'transactionbloc_event.dart';
part 'transactionbloc_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final ApiServices _apiServices;
  final ConnectivityService _connectivityService;

  TransactionBloc(this._apiServices, this._connectivityService)
      : super(TransactionLoadingState()) {
        
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadTransactionEvent());
      }
    });
    on<LoadTransactionEvent>((event, emit) async {
      emit(TransactionLoadingState());
      var transactionResponse = await _apiServices.getTransactionList();
      emit(TransactionLoadedState(transactionResponse: transactionResponse));
    });

    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });
  }
}
