class TransaksiEntity {
  int? noTransaksi;
  String? statusTransaksi;
  DateTime? tglTransaksi;
  List<DataTransaksiEntity>? data;
  int? idCustomer;

  TransaksiEntity(
      {this.noTransaksi,
      this.statusTransaksi,
      this.tglTransaksi,
      this.data,
      this.idCustomer});
}

class DataTransaksiEntity {
  String? idDetailTransaksi;
  int? noTransaksi;
  int? nroObat;
  int? qty;
  String namaObat;
  int hargaObat;

  DataTransaksiEntity(
      {this.idDetailTransaksi,
      this.noTransaksi,
      this.nroObat,
      this.qty,
      required this.namaObat,
      required this.hargaObat});
}
