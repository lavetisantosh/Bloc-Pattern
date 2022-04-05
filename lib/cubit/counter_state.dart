part of 'counter_cubit.dart';

class CounterState {
  var counterValue = 0;
  bool wasIncremented;

  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });
}
