import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> getLoginData();
  Future<Either<Failure, String>> login(
      ParameterUpdate parameterUpdate);
}
