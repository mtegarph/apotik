import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class PostLoginUseCase
    extends UseCase<Either<Failure, String>, ParameterUpdate> {
  final LoginRepository loginRepository;

  PostLoginUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, String>> call({ParameterUpdate? params}) {
    // TODO: implement call
    return loginRepository.login(params!);
  }
}
