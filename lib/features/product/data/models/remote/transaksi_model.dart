class Transaksi {
  String? noTransaksi;
  String? statusTransaksi;
  DateTime? tglTransaksi;
  List<DataTransaksi>? data;
  int? idCustomer;

  Transaksi(
      {this.noTransaksi,
      this.statusTransaksi,
      this.tglTransaksi,
      this.data,
      this.idCustomer});

  factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        noTransaksi: json["noTransaksi"],
        statusTransaksi: json["statusTransaksi"],
        tglTransaksi: json["tglTransaksi"] == null
            ? null
            : DateTime.parse(json["tglTransaksi"]),
        data: json["data"] == null
            ? []
            : List<DataTransaksi>.from(
                json["data"]!.map((x) => DataTransaksi.fromJson(x))),
        idCustomer: json["idCustomer"],
      );

  Map<String, dynamic> toJson() => {
        "noTransaksi": noTransaksi,
        "statusTransaksi": statusTransaksi,
        "tglTransaksi": tglTransaksi?.toIso8601String(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "idCustomer": idCustomer
      };
}

class DataTransaksi {
  String? idDetailTransaksi;
  String? noTransaksi;
  int? nroObat;
  int? qty;
  String namaObat;
  int hargaObat;

  DataTransaksi(
      {this.idDetailTransaksi,
      this.noTransaksi,
      this.nroObat,
      this.qty,
      required this.namaObat,
      required this.hargaObat});

  factory DataTransaksi.fromJson(Map<String, dynamic> json) => DataTransaksi(
        idDetailTransaksi: json["idDetailTransaksi"],
        noTransaksi: json["noTransaksi"],
        nroObat: json["NRO_Obat"],
        qty: json["qty"],
        namaObat: json["namaObat"],
        hargaObat: json["hargaObat"],
      );

  Map<String, dynamic> toJson() => {
        "idDetailTransaksi": idDetailTransaksi,
        "noTransaksi": noTransaksi,
        "NRO_Obat": nroObat,
        "qty": qty,
        "namaObat": namaObat,
        "hargaObat": hargaObat
      };
}
