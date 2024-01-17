part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}
class GetDetailObat extends ProductEvent {
  final int idObat;
  const GetDetailObat(this.idObat);
}