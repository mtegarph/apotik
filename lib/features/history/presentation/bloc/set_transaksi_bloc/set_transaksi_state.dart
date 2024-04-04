part of 'set_transaksi_bloc.dart';

sealed class SetTransaksiBayarState extends Equatable {
  const SetTransaksiBayarState();

  @override
  List<Object> get props => [];
}

final class SetTransaksiBayarInitial extends SetTransaksiBayarState {}

final class SetTransaksiBayarLoading extends SetTransaksiBayarState {}

final class SetTransaksiBayarSuccess extends SetTransaksiBayarState {}

final class SetTransaksiBayarFailed extends SetTransaksiBayarState {
  final String message;

  const SetTransaksiBayarFailed({required this.message});
}
