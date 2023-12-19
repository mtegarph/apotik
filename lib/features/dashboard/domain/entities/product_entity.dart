import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String title;
  final String description;
  final String thumbnail;
  final int stock;
  final int price;

  const ProductEntity(
      {required this.title,
      required this.description,
      required this.thumbnail,
      required this.stock,
      required this.price});
  @override
  List<Object?> get props => [title, description, thumbnail, stock, price];
}
