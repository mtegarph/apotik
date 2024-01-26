import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/core/parameter/register.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:apotik/features/login/domain/usecases/post_register.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_register_event.dart';
part 'post_register_state.dart';

class PostRegisterBloc extends Bloc<PostRegisterEvent, PostRegisterState> {
  final PostRegisterUseCase register;
  PostRegisterBloc(this.register) : super(PostLoginInitial()) {
    on<PostRegister>(onPost);
  }
  void onPost(PostRegister event, Emitter<PostRegisterState> emit) async {
    emit(RegisterPostLoading());
    final result = await register.call(params: event.parameterUpdate);
    result.fold((l) => emit(RegisterPostFailed(message: l.message)),
        (r) => emit(RegisterPostSuccess(message: r)));
  }
}
