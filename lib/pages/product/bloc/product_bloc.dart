import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_block_experto/models/products.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  Product _product = Product.empty();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ProductEventUpdate) {
      // um novo produto pro meu estado
      _updateProduct(
          barcode: event.barCode,
          category: event.category,
          image: event.image,
          value: event.value,
          name: event.name);
      yield ProductDefaultState(product: _product);
    }
    // TODO: implement mapEventToState
  }

  Product get product => _product;

  Product _updateProduct(
      {required String name,
      required String image,
      required String barcode,
      required String category,
      required double value}) {
    return _product = _product.copyWith(
        name: name, category: category, value: value, image: image);
  }
}
