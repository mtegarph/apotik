import 'package:apotik/features/product/data/models/local/obat_hive.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';

class ProductMapper {
  static DetaiObatKeranjangEntity mapToEntityDetailObat(ObatHive obatHive) {
    return DetaiObatKeranjangEntity(
        nroObat: obatHive.nroObat,
        gejala: obatHive.gejala,
        harga: obatHive.harga,
        jenisObat: obatHive.jenisObat,
        merekObat: obatHive.merekObat,
        namaObat: obatHive.namaObat,
        stok: obatHive.stok,
        gambar: obatHive.gambar);
  }
}
