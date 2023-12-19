import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_login_event.dart';
part 'post_login_state.dart';

class PostLoginBloc extends Bloc<PostLoginEvent, PostLoginState> {
  final PostLoginUseCase login;
  PostLoginBloc(this.login) : super(PostLoginInitial()) {
    on<PostLogin>(onPost);
  }
  void onPost(PostLogin event, Emitter<PostLoginState> emit) async {
    emit(LoginPostLoading());
    final result = await login.call(params: event.parameterUpdate);
    result.fold((l) => emit(LoginPostFailed(message: l.message)),
        (r) => emit(LoginPostSuccess(message: r)));
  }
}
