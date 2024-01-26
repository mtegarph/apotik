import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  int? harga;
  String? gambar;
  String? deskripsiObat;
  String? bentukObat;
  String? isiPerkemasan;
  int? idKriteria;
  double? totalWeight;

  ProductEntity({
    this.nroObat,
    this.merekObat,
    this.namaObat,
    this.jenisObat,
    this.harga,
    this.bentukObat,
    this.isiPerkemasan,
    this.idKriteria,
    this.totalWeight,
    this.gambar,
    this.deskripsiObat
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
