import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/usecases/set_product_keranjang_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'keranjang_event.dart';
part 'keranjang_state.dart';

class KeranjangBloc extends Bloc<KeranjangEvent, KeranjangState> {
  final SetProductKeranjangUseCase setProductKeranjangUseCase;
  KeranjangBloc(this.setProductKeranjangUseCase) : super(KeranjangInitial()) {
    on<AddKeranjang>(_onAdd);
  }
  void _onAdd(AddKeranjang event, Emitter<KeranjangState> emit) async {
    emit(AddKeranjangLoading());
    final result = await setProductKeranjangUseCase.call(
        params: event.detaiObatKeranjangEntity);
    result.fold((l) => AddKeranjangFailed(message: l.message),
        (r) => emit(AddKeranjangSuccess()));
  }
}
