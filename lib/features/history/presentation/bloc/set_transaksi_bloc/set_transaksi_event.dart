part of 'set_transaksi_bloc.dart';

sealed class SetTransaksiBayarEvent extends Equatable {
  const SetTransaksiBayarEvent();

  @override
  List<Object> get props => [];
}

class SetTransaksiPayment extends SetTransaksiBayarEvent {
  final ParameterTransaksi parameterTransaksi;

  const SetTransaksiPayment({required this.parameterTransaksi});
}
