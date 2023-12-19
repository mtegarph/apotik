import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/login/data/models/login_model.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:apotik/features/login/presentation/bloc/get_login/login_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late LoginBloc loginBloc;
  late MockGetLoginUseCase mockGetLoginUseCase;
  late MockPostLoginUseCase mockPostLoginUseCase;
  setUp(() {
    mockPostLoginUseCase = MockPostLoginUseCase();
    mockGetLoginUseCase = MockGetLoginUseCase();
    loginBloc = LoginBloc(mockGetLoginUseCase, mockPostLoginUseCase);
  });
  const testUserEntity =
      LoginEntity(id: "1", fullname: "tegar", email: "mtegarph@gmail.com");

  group('bloc test', () {
    test('initial test', () {
      expect(loginBloc.state, LoginInitial());
    });
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoaginLoaded] when MyEvent is added.',
      build: () {
        when(mockGetLoginUseCase.call())
            .thenAnswer((realInvocation) async => const Right(testUserEntity));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const OnLogin()),
      expect: () => <LoginState>[
        LoginLoading(),
        const LoginLoaded(loginEntity: testUserEntity)
      ],
    );
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, loginFailuer] when MyEvent is added.',
      build: () {
        when(mockGetLoginUseCase.call()).thenAnswer((realInvocation) async =>
            const Left(ServerFailure("server failure")));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const OnLogin()),
      expect: () => <LoginState>[
        LoginLoading(),
        const LoginFailed(message: "server failure")
      ],
    );
  });
}
