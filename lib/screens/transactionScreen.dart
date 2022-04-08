import 'package:bloc_example/api/connectivityservice.dart';
import 'package:bloc_example/bloc/transactionbloc/bloc/transactionbloc_bloc.dart';
import 'package:bloc_example/model/transactionresponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/apiservices.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransactionBloc(
        RepositoryProvider.of<ApiServices>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadTransactionEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Transactions',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
          if (state is TransactionLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NoInternetState) {
            return const Center(
              child: Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          if (state is TransactionLoadedState) {
            final List<TransDetail> transDetail =
                state.transactionResponse.transDetails;
            return ListView.builder(
                itemCount: transDetail.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.white70,
                      shadowColor: Colors.black38,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transDetail[index].checkInTime,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.amber),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              transDetail[index].checkInData,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.black38),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              transDetail[index].checkoutTime,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.green),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              transDetail[index].checkoutData,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.amber),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        }),
      ),
    );
  }
}
