import 'dart:io';

import 'package:apotik/core/error/exception.dart';
import 'package:apotik/core/error/failure.dart';
import 'package:apotik/core/parameter/parameter.dart';
import 'package:apotik/features/history/data/datasources/detail_transaksi_api.dart';
import 'package:apotik/features/history/domain/entities/transaction_detail_entity.dart';
import 'package:apotik/features/history/domain/repositories/transaction_detail_repo.dart';
import 'package:dartz/dartz.dart';

class TransactionDetailRepoImpl implements TransactionDetailRepo {
  final DetailTransaksiApi detailTransaksiApi;

  TransactionDetailRepoImpl({required this.detailTransaksiApi});
  @override
  Future<Either<Failure, List<TransactionDetailEntity>>> getTransactionDetail(
      {required int idTransaksi}) async {
    try {
      final result = await detailTransaksiApi.getTransaksiDetail(idTransaksi);

      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To internet"));
    }
  }

  @override
  Future<Either<Failure, bool>> sentTransaksi(
      {required ParameterTransaksi parameter}) async {
    try {
      final result = await detailTransaksiApi.sendTransactionStatusAndImage(
        imageFile: parameter.image,
        noTransaksi: parameter.noTransaksi,
        statusTransaksi: parameter.statusTransaksi,
      );
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An Error Has Occured"));
    } on SocketException {
      return const Left(ConnectionFailure("Failed To Connect To internet"));
    }
  }
}
