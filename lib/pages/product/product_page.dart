import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_experto/models/products.dart';
import 'package:flutter_block_experto/pages/Details/details.dart';
import 'package:flutter_block_experto/pages/product/bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  final GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Produto"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocBuilder<ProductBloc, ProductState>(
              bloc: bloc,
              builder: (context, state) {
                var stateProduct = (state as ProductDefaultState);
                var product = stateProduct.product;
                return ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Name'),
                      onChanged: (name) => bloc.add(ProductEventUpdate(
                          name: name)), //chama o evento q atualiza
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Categoria'),
                      onChanged: (category) => bloc.add(ProductEventUpdate(
                          category: category)), //chama o evento q atualiz
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Imagem'),
                      onChanged: (image) => bloc.add(ProductEventUpdate(
                          image: image)), //chama o evento q atualiz
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Valor'),
                      onChanged: (value) => bloc.add(ProductEventUpdate(
                          value:
                              double.parse(value))), //chama o evento q atualiz
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Código de Barras'),
                      onChanged: (barcode) => bloc.add(ProductEventUpdate(
                          barCode: barcode)), //chama o evento q atualiz
                    ),
                    Padding(
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
                    )
                  ],
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => Details(
                        product: bloc.product,
                      )));
        },
      ),
    );
  }
}
