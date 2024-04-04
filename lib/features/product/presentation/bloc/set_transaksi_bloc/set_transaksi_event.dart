part of 'set_transaksi_bloc.dart';

sealed class SetTransaksiEvent extends Equatable {
  const SetTransaksiEvent();

  @override
  List<Object> get props => [];
}

class SetTransaksi extends SetTransaksiEvent {
  final TransaksiEntity transaksiEntity;

  SetTransaksi({required this.transaksiEntity});
}
