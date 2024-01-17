import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  int? harga;
  String? bentukObat;
  String? isiPerkemasan;
  String? khasiat;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductModel({
    this.nroObat,
    this.merekObat,
    this.namaObat,
    this.jenisObat,
    this.harga,
    this.bentukObat,
    this.isiPerkemasan,
    this.khasiat,
    this.createdAt,
    this.updatedAt,
  }) : super(
          bentukObat: bentukObat,
          harga: harga,
          //  idKriteria: idKriteria,
          isiPerkemasan: isiPerkemasan,
          jenisObat: jenisObat,
          merekObat: merekObat,
          namaObat: namaObat,
          nroObat: nroObat,
          //totalWeight: totalWeight
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        nroObat: json["NRO_Obat"],
        merekObat: json["merekObat"],
        namaObat: json["namaObat"],
        jenisObat: json["jenisObat"],
        harga: json["harga"],
        bentukObat: json["bentukObat"],
        isiPerkemasan: json["isiPerkemasan"],
        khasiat: json["khasiat"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "NRO_Obat": nroObat,
        "merekObat": merekObat,
        "namaObat": namaObat,
        "jenisObat": jenisObat,
        "harga": harga,
        "bentukObat": bentukObat,
        "isiPerkemasan": isiPerkemasan,
        "khasiat": khasiat,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
