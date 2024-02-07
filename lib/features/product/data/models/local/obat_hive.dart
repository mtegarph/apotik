import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:hive/hive.dart';

part 'obat_hive.g.dart';

@HiveType(typeId: 0)
class ObatHive extends HiveObject {
  @HiveField(0)
  int? nroObat;
  @HiveField(1)
  String? merekObat;
  @HiveField(2)
  String? namaObat;
  @HiveField(3)
  String? jenisObat;
  @HiveField(4)
  String? gejala;
  @HiveField(5)
  int? harga;
  @HiveField(6)
  int? stok;
  @HiveField(7)
  String? gambar;

  ObatHive(
      {this.nroObat,
      this.merekObat,
      this.namaObat,
      this.jenisObat,
      this.harga,
      this.stok,
      this.gejala,
      this.gambar});
  factory ObatHive.fromObatEntity(
      DetaiObatKeranjangEntity detaiObatKeranjangEntity) {
    return ObatHive(
        gejala: detaiObatKeranjangEntity.gejala,
        harga: detaiObatKeranjangEntity.harga,
        jenisObat: detaiObatKeranjangEntity.jenisObat,
        merekObat: detaiObatKeranjangEntity.merekObat,
        namaObat: detaiObatKeranjangEntity.namaObat,
        nroObat: detaiObatKeranjangEntity.nroObat,
        stok: detaiObatKeranjangEntity.stok,
        gambar: detaiObatKeranjangEntity.gambar);
  }
}
