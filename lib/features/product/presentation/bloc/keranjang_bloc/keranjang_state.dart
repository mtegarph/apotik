part of 'keranjang_bloc.dart';

sealed class KeranjangState extends Equatable {
  const KeranjangState();

  @override
  List<Object> get props => [];
}

final class KeranjangInitial extends KeranjangState {}

class AddKeranjangLoading extends KeranjangState {}

class AddKeranjangSuccess extends KeranjangState {}

class AddKeranjangFailed extends KeranjangState {
  final String message;

  AddKeranjangFailed({required this.message});
}
