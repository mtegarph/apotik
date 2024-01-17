import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class SetProductKeranjangUseCase
    implements UseCase<Either<Failure, bool>, DetaiObatKeranjangEntity> {
  final ProductDetailRepository productDetailRepository;

  SetProductKeranjangUseCase({required this.productDetailRepository});

  @override
  Future<Either<Failure, bool>> call({DetaiObatKeranjangEntity? params}) {
    // TODO: implement call
    return productDetailRepository.setKeranjangProduct(
        detaiObatKeranjangEntity: params!);
  }
}
