import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  String? name;
  int age;

  User({this.name, this.age = 0});
}

class UserBloc extends Cubit<User> {
  UserBloc() : super(User(name: "", age: 0));

  void renameName(String? newName) {
    emit(User(name: newName, age: state.age));
  }

  void incrementAge() {
    emit(User(name: state.name, age: state.age + 1));
  }

  void decrementAge() {
    emit(User(name: state.name, age: state.age - 1));
  }
}
