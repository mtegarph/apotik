part of 'history_bloc.dart';

abstract class DetailTransaksiEvent extends Equatable {
  const DetailTransaksiEvent();

  @override
  List<Object> get props => [];
}

class GetDetailTransaksi extends DetailTransaksiEvent {
  final int idTransaksi;

  const GetDetailTransaksi({required this.idTransaksi});
}
