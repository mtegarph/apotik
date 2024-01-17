part of 'get_keranjang_bloc.dart';

sealed class GetKeranjangEvent extends Equatable {
  const GetKeranjangEvent();

  @override
  List<Object> get props => [];
}

class GetKeranjang extends GetKeranjangEvent {}
