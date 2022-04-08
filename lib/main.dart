import 'package:bloc_example/api/apiservices.dart';
import 'package:bloc_example/api/connectivityservice.dart';
import 'package:bloc_example/screens/transactionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiServices()),
        RepositoryProvider(create: (context) => ConnectivityService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TransactionScreen(),
      ),
    );
  }
}
