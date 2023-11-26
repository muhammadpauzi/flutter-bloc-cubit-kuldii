import 'package:flutter_bloc/flutter_bloc.dart';

class AppTheme extends Cubit<bool> {
  AppTheme() : super(true);

  void toggleTheme() => emit(!state);
}
