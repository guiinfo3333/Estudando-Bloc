part of 'product_bloc.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {

  @override
  List<Object> get props => [];
}


class ProductDefaultState extends ProductState {
  final Product product;
  ProductDefaultState({required this.product});


}
