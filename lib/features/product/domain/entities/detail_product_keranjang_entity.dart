import 'package:equatable/equatable.dart';

class DetaiObatKeranjangEntity extends Equatable {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  int? harga;
  int? stok;
  String? gejala;
  String? gambar;

  DetaiObatKeranjangEntity(
      {this.nroObat,
      this.merekObat,
      this.namaObat,
      this.jenisObat,
      this.harga,
      this.stok,
      this.gejala,
      this.gambar});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
