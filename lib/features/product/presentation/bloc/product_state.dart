part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();  

  @override
  List<Object> get props => [];
}
class ProductInitial extends ProductState {}
class ObatDetailLoading extends ProductState {}

class ObatDetailSuccess extends ProductState {
  final DetaiObatEntity product;
  const ObatDetailSuccess({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class ObatDetailFailed extends ProductState {
  final String message;
  const ObatDetailFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}