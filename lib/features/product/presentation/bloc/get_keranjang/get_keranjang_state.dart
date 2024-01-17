part of 'get_keranjang_bloc.dart';

sealed class GetKeranjangState extends Equatable {
  const GetKeranjangState();

  @override
  List<Object> get props => [];
}

final class GetKeranjangInitial extends GetKeranjangState {}
class GetKeranjangLoading extends GetKeranjangState {}
class GetKeranjangSuccess extends GetKeranjangState {
  final List<DetaiObatKeranjangEntity> item;

  const GetKeranjangSuccess({required this.item});
}

class GetKeranjangFailed extends GetKeranjangState {
  final String message;

  GetKeranjangFailed({required this.message});
}
