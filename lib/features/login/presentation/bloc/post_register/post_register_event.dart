part of 'post_register_bloc.dart';

sealed class PostRegisterEvent extends Equatable {
  const PostRegisterEvent();

  @override
  List<Object> get props => [];
}

class PostRegister extends PostRegisterEvent {
  final ParameterRegister parameterUpdate;

  const PostRegister({required this.parameterUpdate});
}
