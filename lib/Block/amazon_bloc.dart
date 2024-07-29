import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'amazon_event.dart';
part 'amazon_state.dart';

class AmazonBloc extends Bloc<AmazonEvent, AmazonState> {
  late AmazonModel amazonModel;
  AmazonApi animeApi=AmazonApi();
  AmazonBloc() : super(AmazonInitial()) {
    on<FetchAmazon>((event, emit)async {

      emit(AmazonBlocLoading());
      try{
        amazonModel= await amazonApi.getAmazon();
        emit(AmazonBlocLoaded());
      }
      catch(e){
        emit(AmazonBlocError());
      }
    });
  }
}
