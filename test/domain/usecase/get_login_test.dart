import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:apotik/features/login/domain/usecases/get_login.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockLoginRepository mockLoginRepository;
  late GetLoginUseCase getLoginUseCase;
  setUp(() {
    mockLoginRepository = MockLoginRepository();
    getLoginUseCase = GetLoginUseCase(loginRepository: mockLoginRepository);
  });
  const logintest =
      LoginEntity(id: "1", email: "mtegarph@gmail.com", fullname: "test");
  group("test get login from use case", () {
    test('should get login data from repository', () async {
      //arrange
      when(mockLoginRepository.getLoginData())
          .thenAnswer((realInvocation) async => const Right(logintest));

      //act
      final result = await getLoginUseCase.call();

      //assert
      expect(result, const Right(logintest));
    });
    test('should fail get login data from repository if unsucsesfull',
        () async {
      //arrange
      when(mockLoginRepository.getLoginData()).thenAnswer(
          (realInvocation) async => const Left(ServerFailure("Gagal")));

      //act
      final result = await getLoginUseCase.call();

      //assert
      expect(result, const Left(ServerFailure("Gagal")));
    });
  });
}
