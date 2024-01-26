import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/core/parameter/register.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class PostRegisterUseCase
    extends UseCase<Either<Failure, String>, ParameterRegister> {
  final LoginRepository loginRepository;

  PostRegisterUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, String>> call({ParameterRegister? params}) {
    // TODO: implement call
    return loginRepository.register(params!);
  }
}
