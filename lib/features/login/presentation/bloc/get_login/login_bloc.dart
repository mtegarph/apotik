import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:apotik/features/login/domain/usecases/get_login.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginUseCase getLoginUseCase;
  final PostLoginUseCase login;
  LoginBloc(this.getLoginUseCase, this.login) : super(LoginInitial()) {
    on<OnLogin>(onLogin);
    // on<PostLoginEvent>(onPost);
  }
  void onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final result = await getLoginUseCase.call();
    result.fold((l) => emit(LoginFailed(message: l.message)),
        (r) => emit(LoginLoaded(loginEntity: r)));
  }
}
