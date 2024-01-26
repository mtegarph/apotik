import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';

class DetaiObat extends DetaiObatEntity {
  int? nroObat;
  String? merekObat;
  String? namaObat;
  String? jenisObat;
  String? gejala;
  int? harga;
  String? bentukObat;
  String? isiPerkemasan;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? gambar;
  String? deskripsiObat;
  int? stok;

  DetaiObat(
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
      this.gejala})
      : super(
            bentukObat: bentukObat,
            harga: harga,
            jenisObat: jenisObat,
            merekObat: merekObat,
            namaObat: namaObat,
            nroObat: nroObat,
            isiPerkemasan: isiPerkemasan,
            gejala: gejala,
            gambar: gambar,
            stok: stok,
            deskripsiObat: deskripsiObat);

  factory DetaiObat.fromJson(Map<String, dynamic> json) => DetaiObat(
        nroObat: json["NRO_Obat"],
        merekObat: json["merekObat"],
        namaObat: json["namaObat"],
        jenisObat: json["jenisObat"],
        harga: json["harga"],
        gejala: json["khasiat"],
        bentukObat: json["bentukObat"],
        isiPerkemasan: json["isiPerkemasan"],
        deskripsiObat: json["deskripsiObat"],
        gambar: json["gambar"],
        stok: json["stok"],
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
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
