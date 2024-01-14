import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:oracle_digital/presentation/firebase/firebase_service.dart';
import 'package:oracle_digital/presentation/models/new_today_model.dart';
import 'package:oracle_digital/presentation/models/search_result_model.dart';

part 'news_event.dart';
part 'news_state.dart';

// отправляем всех запросы через bloc на firebase 

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.store}) : super(NewsState()) {

    // этот запрос получает все today news data
    on<LoadNewTodayEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final List<NewTodayModel> data = await store.getNewToday();
        emit(state.copyWith(newTodayList: data, isLoading: false));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });

    // этот запрос получает по умолчание дата
    on<LoadAllEvent>((event, emit) async {
      emit(state.copyWith(isLoadingAll: true));
      try {
        final List<NewTodayModel> data = await store.getNewToday();
        emit(state.copyWith(getAll: data, isLoadingAll: false));
      } catch (e) {
        emit(state.copyWith(errorAll: e.toString(), isLoadingAll: false));
      }
    });

    // поисковик только на базе docs 
    on<LoadSearchResultEvent>((event, emit) async {
      emit(state.copyWith(isLoadingAll: true));
      try {
       
        final List<SearchResultModel> data = await store.getSearchAll(event.value);
        emit(state.copyWith(searchResult: data, isLoadingAll: false));

      } catch (e) {
        emit(state.copyWith(errorAll: e.toString(), isLoadingAll: false));
      }
    });
  }
  final FirebaseService store;
}
