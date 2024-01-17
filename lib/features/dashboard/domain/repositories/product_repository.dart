import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct(String url);
  Future<Either<Failure, DetaiObatEntity>> getDetailProduct(
      {required int idObat});
  Future<Either<Failure, List<ProductEntity>>> getProductSearch(
      {required String keyword, required String searchBy});
}
