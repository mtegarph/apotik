import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseSearch<Type, Params> {
  Future<Type> call({Params? keyword, Params? searchBy});
}

class GetProductSearchUseCase
    implements UseCaseSearch<Either<Failure, List<ProductEntity>>, String?> {
  final ProductRepository productRepository;

  GetProductSearchUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {String? keyword, String? searchBy}) {
    // TODO: implement call
    return productRepository.getProductSearch(
        keyword: keyword.toString(), searchBy: searchBy.toString());
  }
}
