part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

// создадим event 

class LoadNewTodayEvent extends NewsEvent {}
class LoadAllEvent extends NewsEvent {}
class LoadSearchResultEvent extends NewsEvent {
  final String value;
  LoadSearchResultEvent({required this.value});
}

