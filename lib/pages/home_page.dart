import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_experto/bloc/home_bloc.dart';
import 'package:flutter_block_experto/bloc/home_state.dart';

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
