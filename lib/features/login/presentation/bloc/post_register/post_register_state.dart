part of 'post_register_bloc.dart';

sealed class PostRegisterState extends Equatable {
  const PostRegisterState();

  @override
  List<Object> get props => [];
}

final class PostLoginInitial extends PostRegisterState {}

class RegisterPostLoading extends PostRegisterState {}

class RegisterPostSuccess extends PostRegisterState {
  final String message;

  const RegisterPostSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

class RegisterPostFailed extends PostRegisterState {
  final String message;

  const RegisterPostFailed({required this.message});

  @override
  List<Object> get props => [message];
}
