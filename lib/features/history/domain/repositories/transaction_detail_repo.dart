import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/history/domain/entities/transaction_detail_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TransactionDetailRepo {
  Future<Either<Failure, List<TransactionDetailEntity>>> getTransactionDetail(
      {required int idTransaksi});
  Future<Either<Failure, bool>> sentTransaksi(
      {required ParameterTransaksi parameter});
}
