import 'dart:io';

import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/login/data/datasources/remote/login_api_services.dart';
import 'package:apotik/features/login/domain/entities/login_entity.dart';
import 'package:apotik/features/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginApiService loginApiService;
  final LoginPostApi loginPostApi;
  LoginRepositoryImpl(
      {required this.loginApiService, required this.loginPostApi});
  @override
  Future<Either<Failure, LoginEntity>> getLoginData() async {
    try {
      final response = await loginApiService.getLogin();
      return Right(response.data);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("no network"));
    }
  }

  @override
  Future<Either<Failure, String>> login(ParameterUpdate parameterUpdate) async {
    try {
      await loginPostApi.postApi(parameterUpdate);
      return const Right("data successfuly added");
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("no network"));
    }
  }
}
