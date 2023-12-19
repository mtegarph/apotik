part of 'post_login_bloc.dart';

sealed class PostLoginEvent extends Equatable {
  const PostLoginEvent();

  @override
  List<Object> get props => [];
}

class PostLogin extends PostLoginEvent {
  final ParameterUpdate parameterUpdate;

  const PostLogin({required this.parameterUpdate});
}
