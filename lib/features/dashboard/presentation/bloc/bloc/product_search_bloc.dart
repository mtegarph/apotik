import 'package:apotik/features/dashboard/domain/entities/product_entity.dart';
import 'package:apotik/features/dashboard/domain/usecases/get_product_search.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  final GetProductSearchUseCase getProductUseCase;
  ProductSearchBloc(this.getProductUseCase) : super(ProductSearchInitial()) {
    on<ProductSearch>(_onGetProduct);
  }
  void _onGetProduct(
      ProductSearch event, Emitter<ProductSearchState> emit) async {
    emit(ProductSearchLoading());
    final result = await getProductUseCase.call(
        keyword: event.keyword, searchBy: event.searchBy);
    result.fold((l) => emit(ProductSearchFailed(message: l.message)),
        (r) => emit(ProductSearchSuccess(products: r)));
  }
}
