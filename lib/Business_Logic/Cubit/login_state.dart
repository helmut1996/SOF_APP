part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  get isLogged => null;
}

class LoginLoading extends LoginState {}

class LoginChecked extends LoginState {
  final LoggedIn isLogged;

  LoginChecked({required this.isLogged});

  @override
  String toString() {
    return 'CheckLogin{isLogged: $isLogged}';
  }
}

class LoggedInApp extends LoginState {
  final LoggedIn isLogged;

  LoggedInApp({required this.isLogged});
  @override
  String toString() {
    return 'LoggedInApp{isLogged: $isLogged}';
  }
}

class LoggedOutApp extends LoginState {
  final LoggedIn isLogged;

  LoggedOutApp({required this.isLogged});
}

class LoginError extends LoginState {}
