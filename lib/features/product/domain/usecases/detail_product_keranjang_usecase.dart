import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetKeranjangProductUseCase
    implements UseCase<Either<Failure, List<DetaiObatKeranjangEntity>>, void> {
  final ProductDetailRepository productDetailRepository;

  GetKeranjangProductUseCase({required this.productDetailRepository});
  @override
  Future<Either<Failure, List<DetaiObatKeranjangEntity>>> call({void params}) {
    // TODO: implement call
    return productDetailRepository.getProductKeranjang();
  }
}
