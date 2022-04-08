part of 'transactionbloc_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();
}

class LoadTransactionEvent extends TransactionEvent {
  @override
  List<Object> get props => [];
}

class NoInternetEvent extends TransactionEvent {
  @override
  List<Object?> get props => [];

}
