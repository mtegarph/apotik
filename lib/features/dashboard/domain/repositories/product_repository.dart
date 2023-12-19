import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}
