part of 'transaksi_history_bloc.dart';

sealed class TransaksiHistoryEvent extends Equatable {
  const TransaksiHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetTransaksi extends TransaksiHistoryEvent {
  final int idCustomer;
  GetTransaksi({
    required this.idCustomer,
  });
}
