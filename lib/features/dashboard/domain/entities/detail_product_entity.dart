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

  DetaiObatEntity({
    this.nroObat,
    this.merekObat,
    this.namaObat,
    this.jenisObat,
    this.harga,
    this.bentukObat,
    this.isiPerkemasan,
    this.createdAt,
    this.updatedAt,
    this.gejala
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}