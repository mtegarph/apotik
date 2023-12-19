import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductUseCase implements UseCase<Either<Failure, List<ProductEntity>>, void> {
  final ProductRepository productRepository;

  GetProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call({void params}) {
    // TODO: implement call
    return productRepository.getProduct();
  }
}