import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;
  const LoginSuccessState(this.message);
}

class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState(this.message);
}