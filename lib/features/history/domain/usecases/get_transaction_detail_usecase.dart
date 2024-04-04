import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/usecase/usecase.dart';
import 'package:apotik/features/history/domain/entities/transaction_detail_entity.dart';
import 'package:apotik/features/history/domain/repositories/transaction_detail_repo.dart';
import 'package:dartz/dartz.dart';

class GetDetailTransaksiUseCase
    implements UseCase<Either<Failure, List<TransactionDetailEntity>>, int> {
  final TransactionDetailRepo transactionDetailRepo;

  GetDetailTransaksiUseCase({required this.transactionDetailRepo});

  @override
  Future<Either<Failure, List<TransactionDetailEntity>>> call({int? params}) {
    // TODO: implement call
    return transactionDetailRepo.getTransactionDetail(idTransaksi: params!);
  }
}
