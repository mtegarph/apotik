part of 'product_search_bloc.dart';

sealed class ProductSearchState extends Equatable {
  const ProductSearchState();

  @override
  List<Object> get props => [];
}

final class ProductSearchInitial extends ProductSearchState {}

final class ProductSearchLoading extends ProductSearchState {}

final class ProductSearchSuccess extends ProductSearchState {
  final List<ProductEntity> products;

  const ProductSearchSuccess({required this.products});
}

class ProductSearchFailed extends ProductSearchState{
  final String message;

  const ProductSearchFailed({required this.message});
}
