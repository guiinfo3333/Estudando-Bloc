import 'package:flutter/material.dart';
import 'package:flutter_block_experto/models/products.dart';

class Details extends StatelessWidget {

  final Product product;

  Details({required this.product});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Detalhes do produto"),
            ),
            Text("Nome ${product.name}"),
            Text("Categoria ${product.category}"),
            Text("valor ${product.value}"),

          ],
        ),
      ),
    );
  }
}
