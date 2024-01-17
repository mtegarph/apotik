import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';
import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetDetailProductUseCase
    implements UseCase<Either<Failure, DetaiObatEntity>, int?> {
  final ProductRepository productRepository;

  GetDetailProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, DetaiObatEntity>> call({int? params}) {
    return productRepository.getDetailProduct(idObat: params!);
  }
}
