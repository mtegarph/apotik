part of 'transaksi_history_bloc.dart';

sealed class TransaksiHistoryState extends Equatable {
  const TransaksiHistoryState();

  @override
  List<Object> get props => [];
}

final class TransaksiHistoryInitial extends TransaksiHistoryState {}

final class TransaksiHistoryLoading extends TransaksiHistoryState {}

final class TransaksiHistorySuccess extends TransaksiHistoryState {
  final List<TransaksiHistoryEntity> products;

  const TransaksiHistorySuccess({required this.products});
}

class TransaksiHistoryFailed extends TransaksiHistoryState{
  final String message;

  const TransaksiHistoryFailed({required this.message});
}
