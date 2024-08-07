import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/API/Api3.dart';
import '../Repository/ModelClass/AmazonModel3.dart';

part 'amazon3_event.dart';
part 'amazon3_state.dart';

class Amazon3Bloc extends Bloc<Amazon3Event, Amazon3State> {
  late AmazonModel3 amazonModel3;
  AmazonApi3 amazonApi3=AmazonApi3();
  Amazon3Bloc() : super(Amazon3Initial()) {
    on<FetchAmazon3>((event, emit) async {

      emit(Amazon3BlocLoading());
      try{
        amazonModel3= await amazonApi3.getAmazon3(event.id);
        emit(Amazon3BlocLoaded());
      }
      catch(e){
        emit(Amazon3BlocError());
      }
    });
  }
}
