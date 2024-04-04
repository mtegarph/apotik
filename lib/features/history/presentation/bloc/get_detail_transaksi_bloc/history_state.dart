part of 'history_bloc.dart';

abstract class DetailTransaksiState extends Equatable {
  const DetailTransaksiState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends DetailTransaksiState {}

final class DetailTransaksiLoading extends DetailTransaksiState {}

final class DetailTransaksiSuccess extends DetailTransaksiState {
  final List<TransactionDetailEntity> products;

  const DetailTransaksiSuccess({required this.products});
}

class DetailTransaksiFailed extends DetailTransaksiState {
  final String message;

  const DetailTransaksiFailed({required this.message});
}
