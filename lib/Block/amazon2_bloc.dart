import 'package:amazone/Repository/API/API.dart';
import 'package:amazone/Repository/API/Api2.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/ModelClass/AmazonModel2.dart';

part 'amazon2_event.dart';
part 'amazon2_state.dart';

class Amazon2Bloc extends Bloc<Amazon2Event, Amazon2State> {
  late AmazonModel2 amazonModel2;
  AmazonApi2 amazonApi2=AmazonApi2();
  Amazon2Bloc() : super(Amazon2Initial()) {
    on<FetchAmazon2>((event, emit) async {

      emit(Amazon2BlocLoading());
      try{
        amazonModel2= await amazonApi2.getAmazon(event.id);
        emit(Amazon2BlocLoaded());
      }
      catch(e){
        emit(Amazon2BlocError());
      }
    });
  }
}
