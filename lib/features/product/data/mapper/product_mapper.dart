import 'package:apotik/features/product/data/models/local/obat_hive.dart';
import 'package:apotik/features/product/data/models/remote/transaksi_model.dart';
import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';

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

  static Transaksi entityToModelTransaksi(TransaksiEntity entity) {
    return Transaksi(
      idCustomer: entity.idCustomer,
      noTransaksi: entity.noTransaksi.toString(),
      statusTransaksi: entity.statusTransaksi,
      tglTransaksi: entity.tglTransaksi,
      data: entity.data?.map((data) => entityToData(data)).toList(),
    );
  }

  // static DataTransaksiEntity dataToEntity(DataTransaksi data) {
  //   return DataTransaksiEntity(
  //     idDetailTransaksi: data.idDetailTransaksi,
  //     noTransaksi: data.noTransaksi,
  //     nroObat: data.nroObat,
  //     qty: data.qty,
  //   );
  // }

  // Helper method for converting DataTransaksiEntity to DataTransaksi model
  static DataTransaksi entityToData(DataTransaksiEntity entity) {
    return DataTransaksi(
        idDetailTransaksi: entity.idDetailTransaksi,
        noTransaksi: entity.noTransaksi.toString(),
        nroObat: entity.nroObat,
        qty: entity.qty,
        hargaObat: entity.hargaObat,
        namaObat: entity.namaObat);
  }
}
