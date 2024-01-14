import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oracle_digital/presentation/firebase/firebase_service.dart';
import 'package:oracle_digital/presentation/models/new_today_model.dart';


part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc({required this.store}) : super(PersonState()) {

    //  тут отправляем запрос на личные фотогрии через bloc на firebase services обработал загрузку и ощибку если нет ощибка тогда сохраняем на стейт bloc ну принципы здесь нету личный я просто создал на firebase база оттуда я получаю на самам деле не было конкретного тз поэтому я простой сделал 
    
    on<LoadImagesPersonEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final List<NewTodayModel> data = await store.getImages();
        emit(state.copyWith(images: data, isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });
  }

  final FirebaseService store;
}
