import 'package:apotik/features/product/domain/entities/detail_product_keranjang_entity.dart';
import 'package:apotik/features/product/domain/usecases/detail_product_keranjang_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_keranjang_event.dart';
part 'get_keranjang_state.dart';

class GetKeranjangBloc extends Bloc<GetKeranjangEvent, GetKeranjangState> {
  final GetKeranjangProductUseCase getKeranjangProductUseCase;
  GetKeranjangBloc(this.getKeranjangProductUseCase)
      : super(GetKeranjangInitial()) {
    on<GetKeranjang>(getKeranjang);
  }
  void getKeranjang(GetKeranjang event, Emitter<GetKeranjangState> emit) async {
    emit(GetKeranjangLoading());
    final response = await getKeranjangProductUseCase.call();
    response.fold((l) => emit(GetKeranjangFailed(message: l.message)),
        (r) => emit(GetKeranjangSuccess(item: r)));
  }
}
