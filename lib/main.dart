import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  // CounterCubit() : super(0);
  // or
  int initialData;
  CounterCubit({this.initialData = 0}) : super(initialData);

  int? current;
  int? next;

  void increment() {
    super.emit(state + 1);
  }

  void decrement() {
    super.emit(state - 1);
  }

  // Observer
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error.toString());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit counter = CounterCubit(initialData: 0);

  @override
  Widget build(BuildContext context) {
    print("BUILDER OR REBUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text("CUBIT APP"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: counter.initialData,
            stream: counter.stream,
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }

              return Column(
                children: [
                  Text(
                    "Current: ${counter.current.toString()} / Next: ${counter.next.toString()}",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    snapshot.data.toString(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => counter.decrement(),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => counter.increment(),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
