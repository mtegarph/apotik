part of 'product_search_bloc.dart';

sealed class ProductSearchEvent extends Equatable {
  const ProductSearchEvent();

  @override
  List<Object> get props => [];
}

class ProductSearch extends ProductSearchEvent {
  final String keyword;
  final String searchBy;
  ProductSearch({required this.keyword, required this.searchBy});
}
