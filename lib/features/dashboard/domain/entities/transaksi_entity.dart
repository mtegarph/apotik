class TransaksiHistoryEntity {
  final int noTransaksi;
  final String statusTransaksi;
  final DateTime tglTransaksi;
  final String? imagePath;
  final int idCustomer;
  final DateTime createdAt;
  final DateTime updatedAt;

  TransaksiHistoryEntity({
    required this.noTransaksi,
    required this.statusTransaksi,
    required this.tglTransaksi,
    this.imagePath,
    required this.idCustomer,
    required this.createdAt,
    required this.updatedAt,
  });
}
