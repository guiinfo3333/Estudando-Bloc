import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_experto/pages/home/bloc/home_state.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Bloc"),
      ),
      body: BlocBuilder<HomeBloc,HomeState>(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (context, state) {

          if(state is HomeLoagingState){
            return ListView.builder(
                itemBuilder: (context,index){
                  return ListTile(
                      title:Text("Item $index")
                  );
                }
            );
          }
          if(state is HomeErrorState){
            return Center(
              child: Text(state.message),
            );
          }

          if(state is HomeStateEmptyList){
            return Center(
              child: Text("Não há dados disponíveis"),
            );
          }

          return CircularProgressIndicator();
        }
      ),
    );
  }
}
