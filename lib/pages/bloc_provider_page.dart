import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kuldii/bloc/app_theme.dart';
import 'package:flutter_bloc_kuldii/bloc/counter.dart';

class BlocProviderPage extends StatelessWidget {
  const BlocProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILD BLOC PROVIDER: CHECK .WATCH IN PARENT");
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC PROVIDER"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppTheme>().toggleTheme();
        },
        child: context.read<AppTheme>().state
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiBlocListener(
            listeners: [
              BlocListener<AppTheme, bool>(
                listener: (context, state) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Theme Mode changed to Dark!"),
                  ),
                ),
                listenWhen: (previous, current) => !current,
              ),
              BlocListener<Counter, int>(
                listener: (context, state) =>
                    ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Even!"),
                  ),
                ),
                listenWhen: (previous, current) => current % 2 == 0,
              )
            ],
            child: BlocBuilder<Counter, int>(
              bloc: BlocProvider.of<Counter>(context),
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
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => BlocProvider.of<Counter>(context).decrement(),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => BlocProvider.of<Counter>(context).increment(),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
