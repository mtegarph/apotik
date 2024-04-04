import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/domain/usecases/post_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PostLoginUseCase postLoginUseCase;
  late MockLoginRepository mockLoginRepository;
  setUp(() {
    mockLoginRepository = MockLoginRepository();
    postLoginUseCase = PostLoginUseCase(loginRepository: mockLoginRepository);
  });
  const tParams = ParameterUpdate(
      password: 'test@test.com', name: 'password', noHp: "123123123",);
  const tSuccessResponse = 'Success';

  group("run post Login", () {
    test("should return login repository success", () async {
      when(mockLoginRepository.login(tParams))
          .thenAnswer((realInvocation) async => const Right(tSuccessResponse));
      final result = await postLoginUseCase.call(params: tParams);
      expect(result, const Right(tSuccessResponse));
    });
    test("should return login repository failed", () async {
      when(mockLoginRepository.login(tParams)).thenAnswer(
          (realInvocation) async => const Left(ServerFailure("Failed")));
      final result = await postLoginUseCase.call(params: tParams);
      expect(result, const Left(ServerFailure("Failed")));
    });
  });
}
