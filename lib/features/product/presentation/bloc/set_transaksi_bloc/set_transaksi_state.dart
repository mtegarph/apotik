part of 'set_transaksi_bloc.dart';

sealed class SetTransaksiState extends Equatable {
  const SetTransaksiState();

  @override
  List<Object> get props => [];
}

final class SetTransaksiInitial extends SetTransaksiState {}

class SetTransaksiLoading extends SetTransaksiState {}

class SetTransaksiSuccess extends SetTransaksiState {}

class SetTransaksiFailed extends SetTransaksiState {
  final String message;

  const SetTransaksiFailed({required this.message});
}
