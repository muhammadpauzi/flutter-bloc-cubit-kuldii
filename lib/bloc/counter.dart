import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
