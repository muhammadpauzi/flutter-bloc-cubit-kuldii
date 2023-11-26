import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kuldii/bloc/user_bloc.dart';

class BlocSelectorPage extends StatelessWidget {
  const BlocSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC SELECTOR"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocSelector<UserBloc, User, String?>(
              selector: (state) {
                return state.name;
              },
              builder: (context, state) {
                print("TEXT 'NAME' REBUILD");
                return Text(
                  "Name: $state",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocSelector<UserBloc, User, int>(
              selector: (state) {
                return state.age;
              },
              builder: (context, state) {
                print("TEXT 'AGE' REBUILD");
                return Text(
                  "Age: $state",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => context.read<UserBloc>().renameName(value),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => context.read<UserBloc>().decrementAge(),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => context.read<UserBloc>().incrementAge(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
