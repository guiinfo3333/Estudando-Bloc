part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {

  @override
  List<Object> get props => [];
}


class ProductDefaultState extends ProductState {
  final Product product;
  ProductDefaultState({required this.product});

  @override
  List<Object> get props => [product];
}
