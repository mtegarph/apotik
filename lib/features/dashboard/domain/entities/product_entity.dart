import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  int? harga;
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
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
