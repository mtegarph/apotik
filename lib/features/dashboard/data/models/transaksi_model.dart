import 'package:apotik/features/dashboard/domain/entities/transaksi_entity.dart';
import 'package:apotik/features/product/domain/entities/transaksi_entity.dart';

class Transaction extends TransaksiHistoryEntity {
  final int noTransaksi;
  final String statusTransaksi;
  final DateTime tglTransaksi;
  final String? imagePath;
  final int idCustomer;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.noTransaksi,
    required this.statusTransaksi,
    required this.tglTransaksi,
    this.imagePath,
    required this.idCustomer,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
            createdAt: createdAt,
            updatedAt: updatedAt,
            noTransaksi: noTransaksi,
            statusTransaksi: statusTransaksi,
            tglTransaksi: tglTransaksi,
            imagePath: imagePath,
            idCustomer: idCustomer);

  // Method to convert a Transaction object into a Map
  Map<String, dynamic> toJson() => {
        'noTransaksi': noTransaksi,
        'statusTransaksi': statusTransaksi,
        'tglTransaksi': tglTransaksi.toIso8601String(),
        'imagePath': imagePath,
        'idCustomer': idCustomer,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  // Factory constructor to create a Transaction object from a Map
  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        noTransaksi: json['noTransaksi'],
        statusTransaksi: json['statusTransaksi'],
        tglTransaksi: DateTime.parse(json['tglTransaksi']),
        imagePath: json['imagePath'],
        idCustomer: json['idCustomer'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );
}
