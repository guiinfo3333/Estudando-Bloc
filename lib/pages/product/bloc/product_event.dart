part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}



//faz as substituicoes do parametro do produto
class ProductEventUpdate extends ProductEvent{
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;

  ProductEventUpdate(
      {this.name = "",
        this.barCode = "",
        this.category = "",
        this.value = 0.00,
        this.image = ""});
  @override
  // TODO: implement props
  List<Object?> get props =>[];

}
