import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class GetLoginUseCase implements UseCase<Either<Failure, LoginEntity>, void> {
  final LoginRepository loginRepository;

  GetLoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, LoginEntity>> call({void params}) {
    // TODO: implement call
    return loginRepository.getLoginData();
  }
}
