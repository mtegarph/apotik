import 'dart:io';

import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/product/data/datasources/local/hive_data.dart';
import 'package:apotik/features/product/data/datasources/remote/transaksi_api_service.dart';
import 'package:apotik/features/product/data/mapper/product_mapper.dart';
import 'package:apotik/features/product/data/models/local/obat_hive.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class DetailProductRepositoryImpl implements ProductDetailRepository {
  final HiveData hiveData;
  final TransaksiApiService transaksiApiService;

  DetailProductRepositoryImpl({
    required this.hiveData,
    required this.transaksiApiService,
  });
  @override
  Future<Either<Failure, List<DetaiObatKeranjangEntity>>>
      getProductKeranjang() async {
    // TODO: implement getProductKeranjang
    try {
      final response = await hiveData.getAllDataSurvey();
      return Right(
          response.map((e) => ProductMapper.mapToEntityDetailObat(e)).toList());
    } on SocketException {
      return const Left(ConnectionFailure("no network"));
    }
  }

  @override
  Future<Either<Failure, bool>> setKeranjangProduct(
      {required DetaiObatKeranjangEntity detaiObatKeranjangEntity}) async {
    try {
      await hiveData
          .addSurveyOffline(ObatHive.fromObatEntity(detaiObatKeranjangEntity));
      return const Right(true);
    } on SocketException {
      return const Left(ConnectionFailure("no network"));
    }
  }

  @override
  Future<Either<Failure, bool>> setTransaksi(
      {required TransaksiEntity transaksi}) async {
    // TODO: implement setTransaksi
    try {
      await transaksiApiService
          .postTransaksi(ProductMapper.entityToModelTransaksi(transaksi));
      return const Right(true);
    } on SocketException {
      return const Left(ConnectionFailure("no network"));
    }
  }
}
