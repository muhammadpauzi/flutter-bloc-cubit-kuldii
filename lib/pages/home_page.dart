import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kuldii/bloc/counter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SecondExample(counter: counter), // More simple than FirstExample
          // FirstExample(counter: counter),

          // Wihout BLOC using StreamBuilder
          // StreamBuilder(
          //   // initialData: counter.state,
          //   stream: counter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       snapshot.data.toString(),
          //       style: const TextStyle(
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     );
          //   },
          // ),
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

class FirstExample extends StatelessWidget {
  const FirstExample({
    super.key,
    required this.counter,
  });

  final Counter counter;

  @override
  Widget build(BuildContext context) {
    return BlocListener<Counter, int>(
      bloc: counter,
      listenWhen: (previous, current) => current == 10,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(
              seconds: 1,
            ),
            content: Text("10 TERCAPAI!"),
          ),
        );
      },
      child: BlocBuilder<Counter, int>(
        bloc: counter,
        buildWhen: (previous, current) => current % 2 == 0,
        builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }
}

class SecondExample extends StatelessWidget {
  const SecondExample({
    super.key,
    required this.counter,
  });

  final Counter counter;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Counter, int>(
      bloc: counter,
      listenWhen: (previous, current) => current == 10,
      listener: (context, state) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(
              seconds: 1,
            ),
            content: Text("10 TERCAPAI!"),
          ),
        );
      },
      buildWhen: (previous, current) => current % 2 == 0,
      builder: (context, state) {
        return Text(
          state.toString(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
