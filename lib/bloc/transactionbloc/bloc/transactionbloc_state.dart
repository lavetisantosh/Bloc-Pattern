part of 'transactionbloc_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionLoadingState extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionLoadedState extends TransactionState {
  final TransactionResponse transactionResponse;

  const TransactionLoadedState({required this.transactionResponse});

  @override
  List<Object> get props => [transactionResponse];
}

class NoInternetState extends TransactionState {
  @override
  List<Object?> get props => [];
}
