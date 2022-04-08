import 'package:bloc_example/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Example"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.wasIncremented) {
              Scaffold.of(context)
                  // ignore: deprecated_member_use
                  .showSnackBar(const SnackBar(content: Text('Incremented!'),duration: Duration(milliseconds: 300),));
            } else {
              Scaffold.of(context)
                  // ignore: deprecated_member_use
                  .showSnackBar(const SnackBar(content: Text('Decremented!'),duration: Duration(milliseconds: 300),));
            }
          },
            builder: (context, state) {
              return Text(
                'Counter Value : ${state.counterValue.toString()}',
                style: const TextStyle(fontSize: 30, color: Colors.blueAccent),
              );
            },
          ),
        ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
