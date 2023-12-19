part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}



class LoginLoaded extends LoginState {
  final LoginEntity loginEntity;

  const LoginLoaded({required this.loginEntity});

  @override
  List<Object?> get props => [loginEntity];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}


