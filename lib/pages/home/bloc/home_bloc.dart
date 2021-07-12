import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_experto/pages/home/bloc/home_event.dart';
import 'package:flutter_block_experto/pages/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc(HomeState initialState) : super(HomeStateLoaded(list: []));

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

  switch(event.runtimeType){
    case HomeFecthList:
      yield await _fetchList();
      break;
    case HomeFecthListWithError:
      yield await _fetchListWithError();
      break;
    case HomeFecthListWithEmpty:
      yield await _fetchListWithEmptyList();
      break;
    default:
  }
  }


  Future<HomeState> _fetchList() async{
    var list = await Future.delayed(Duration(
      seconds: 3,
    ),()=><String>[
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
      'Item 1'
    ]);

    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithEmptyList() async{
    await Future.delayed(Duration(
      seconds: 3,
    ),()=><String>[
    ]);

    return HomeStateEmptyList();
  }

  Future<HomeState> _fetchListWithError() async{
    return await Future.delayed(Duration(
      seconds: 3,
    ),()=>HomeErrorState(message: "Não Foi possível carregar dados."));
  }

}