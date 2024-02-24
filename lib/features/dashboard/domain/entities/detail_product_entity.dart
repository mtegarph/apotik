import 'package:equatable/equatable.dart';

class DetaiObatEntity extends Equatable {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  int? harga;
  String? bentukObat;
  String? isiPerkemasan;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gejala;
  String? gambar;
  String? deskripsiObat;
  int? stok;

  DetaiObatEntity(
      {this.nroObat,
      this.merekObat,
      this.namaObat,
      this.jenisObat,
      this.harga,
      this.bentukObat,
      this.isiPerkemasan,
      this.createdAt,
      this.updatedAt,
      this.gambar,
      this.deskripsiObat,
      this.stok,
      this.gejala});
  DetaiObatEntity copyWith({
    int? nroObat,
    String? merekObat,
    String? namaObat,
    String? jenisObat,
    int? harga,
    String? bentukObat,
    String? isiPerkemasan,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? gejala,
    String? gambar,
    String? deskripsiObat,
    int? stok,
  }) {
    return DetaiObatEntity(
      nroObat: nroObat ?? this.nroObat,
      merekObat: merekObat ?? this.merekObat,
      namaObat: namaObat ?? this.namaObat,
      jenisObat: jenisObat ?? this.jenisObat,
      harga: harga ?? this.harga,
      bentukObat: bentukObat ?? this.bentukObat,
      isiPerkemasan: isiPerkemasan ?? this.isiPerkemasan,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      gejala: gejala ?? this.gejala,
      gambar: gambar ?? this.gambar,
      deskripsiObat: deskripsiObat ?? this.deskripsiObat,
      stok: stok ?? this.stok,
    );
  }

  @override
  List<Object?> get props => [
        nroObat,
        merekObat,
        namaObat,
        jenisObat,
        harga,
        bentukObat,
        isiPerkemasan,
        createdAt,
        updatedAt,
        gejala,
        gambar,
        deskripsiObat,
        stok,
      ];      
}
