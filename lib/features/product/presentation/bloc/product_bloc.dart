import 'dart:async';

import 'package:apotik/features/dashboard/domain/entities/detail_product_entity.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_detail_product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetDetailProductUseCase getProductDetailUseCase;
  ProductBloc(this.getProductDetailUseCase) : super(ProductInitial()) {
    on<GetDetailObat>(_onGetDetailProduct);
  }

  FutureOr<void> _onGetDetailProduct(
      GetDetailObat event, Emitter<ProductState> emit) async {
    emit(ObatDetailLoading());
    final result = await getProductDetailUseCase.call(params: event.idObat);
    result.fold((l) => emit(ObatDetailFailed(message: l.message)),
        (r) => emit(ObatDetailSuccess(product: r)));
  }
}
