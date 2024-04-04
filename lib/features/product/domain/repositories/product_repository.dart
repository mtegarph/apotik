import 'package:apotik/core/error/failure.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailRepository {
  Future<Either<Failure, List<DetaiObatKeranjangEntity>>> getProductKeranjang();
  Future<Either<Failure, bool>> setKeranjangProduct(
      {required DetaiObatKeranjangEntity detaiObatKeranjangEntity});
  Future<Either<Failure, bool>> setTransaksi(
      {required TransaksiEntity transaksi});
}
