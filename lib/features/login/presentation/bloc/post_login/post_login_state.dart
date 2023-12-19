part of 'post_login_bloc.dart';

sealed class PostLoginState extends Equatable {
  const PostLoginState();

  @override
  List<Object> get props => [];
}

final class PostLoginInitial extends PostLoginState {}

class LoginPostLoading extends PostLoginState {}

class LoginPostSuccess extends PostLoginState {
  final String message;

  const LoginPostSuccess({required this.message});
  @override
  List<Object> get props => [message];
}

class LoginPostFailed extends PostLoginState {
  final String message;

  const LoginPostFailed({required this.message});

  @override
  List<Object> get props => [message];
}
