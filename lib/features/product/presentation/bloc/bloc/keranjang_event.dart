part of 'keranjang_bloc.dart';

sealed class KeranjangEvent extends Equatable {
  const KeranjangEvent();

  @override
  List<Object> get props => [];
}

class AddKeranjang extends KeranjangEvent {
  final DetaiObatKeranjangEntity detaiObatKeranjangEntity;

  const AddKeranjang({required this.detaiObatKeranjangEntity});
}
