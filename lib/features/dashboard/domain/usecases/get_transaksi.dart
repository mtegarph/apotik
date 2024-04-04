import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/dashboard/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/dashboard/domain/repositories/product_repository.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';
import 'package:dartz/dartz.dart';

class GetTransaksiUseCase
    implements UseCase<Either<Failure, List<TransaksiHistoryEntity>>, int> {
  final ProductRepository productRepository;

  GetTransaksiUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<TransaksiHistoryEntity>>> call({int? params}) {
    // TODO: implement call
    return productRepository.getTransaksi(idCustomer: params!);
  }
}
