import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;

  Product(
      {this.name = "",
      this.barCode = "",
      this.category = "",
      this.value = 0.00,
      this.image = ""});

  Product.empty({this.name="",this.barCode="",this.category="",this.image="",this.value=0.00});

  @override
  // TODO: implement props
  List<Object?> get props => [name, barCode, category, value, image];

  Product copyWith(
      {String? name,
      String? barCode,
      String? category,
      double? value,
      String? image}) {
    return Product(
      barCode: barCode ?? this.barCode,
      category: category ?? this.category,
      image: image ?? this.image,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}
