class TransactionDetailEntity {
  final String idDetailTransaksi;
  final int qty;
  final String namaObat;
  final int hargaObat;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int noTransaksi;
  final int nroObat;

  TransactionDetailEntity({
    required this.idDetailTransaksi,
    required this.qty,
    required this.namaObat,
    required this.hargaObat,
    required this.createdAt,
    required this.updatedAt,
    required this.noTransaksi,
    required this.nroObat,
  });
}
