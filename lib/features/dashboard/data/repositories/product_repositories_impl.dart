import 'dart:io';

import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/dashboard/data/datasources/product_api_service.dart';
import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProducApiService producApiService;

  ProductRepositoryImpl({required this.producApiService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct(String url) async {
    // TODO: implement getProduct
    try {
      final result = await producApiService.getProduct(url);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To internet"));
    }
  }

  @override
  Future<Either<Failure, DetaiObatEntity>> getDetailProduct(
      {required int idObat}) async {
    // TODO: implement getDetailProduct
    try {
      final result = await producApiService.getDetailProduct(idObat);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To internet"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductSearch(
      {required String keyword, required String searchBy}) async {
    // TODO: implement getProductSearch
    try {
      final result = await producApiService.getProductSearch(keyword, searchBy);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To internet"));
    }
  }
}
