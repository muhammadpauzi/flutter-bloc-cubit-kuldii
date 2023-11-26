import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kuldii/bloc/user_bloc.dart';
import 'package:flutter_bloc_kuldii/pages/bloc_selector_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: const MaterialApp(
        home: BlocSelectorPage(),
      ),
    );
  }
}
