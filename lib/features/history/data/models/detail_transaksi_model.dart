import 'package:apotik/features/history/domain/entities/transaction_detail_entity.dart';

class TransactionDetailModel extends TransactionDetailEntity {
  final String idDetailTransaksi;
  final int qty;
  final String namaObat;
  final int hargaObat;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int noTransaksi;
  final int nroObat;

  TransactionDetailModel({
    required this.idDetailTransaksi,
    required this.qty,
    required this.namaObat,
    required this.hargaObat,
    required this.createdAt,
    required this.updatedAt,
    required this.noTransaksi,
    required this.nroObat,
  }) : super(
            createdAt: createdAt,
            hargaObat: hargaObat,
            idDetailTransaksi: idDetailTransaksi,
            updatedAt: updatedAt,
            qty: qty,
            namaObat: namaObat,
            noTransaksi: noTransaksi,
            nroObat: nroObat);

  // Method to convert a TransactionDetail object into a Map
  Map<String, dynamic> toJson() => {
        'idDetailTransaksi': idDetailTransaksi,
        'qty': qty,
        'namaObat': namaObat,
        'hargaObat': hargaObat,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'noTransaksi': noTransaksi,
        'NRO_Obat': nroObat,
      };

  // Factory constructor to create a TransactionDetail object from a Map
  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) =>
      TransactionDetailModel(
        idDetailTransaksi: json['idDetailTransaksi'],
        qty: json['qty'],
        namaObat: json['namaObat'],
        hargaObat: json['hargaObat'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        noTransaksi: json['noTransaksi'],
        nroObat: json['NRO_Obat'],
      );
}
