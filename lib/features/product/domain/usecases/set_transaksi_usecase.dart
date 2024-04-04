import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class SetTransaksiUseCase
    implements UseCase<Either<Failure, bool>, TransaksiEntity> {
  final ProductDetailRepository productDetailRepository;

  SetTransaksiUseCase({required this.productDetailRepository});

  @override
  Future<Either<Failure, bool>> call({TransaksiEntity? params}) {
    // TODO: implement call
    return productDetailRepository.setTransaksi(
        transaksi: params!);
  }
}