import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_kuldii/bloc/app_theme.dart';
import 'package:flutter_bloc_kuldii/bloc/counter.dart';
import 'package:flutter_bloc_kuldii/pages/bloc_provider_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Counter()),
        BlocProvider(create: (context) => AppTheme()),
      ],
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print("BUILD MATERIAL APP");
    return MaterialApp(
      theme: context.watch<AppTheme>().state
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      home: const BlocProviderPage(),
    );
  }
}
