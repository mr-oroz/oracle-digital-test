part of 'news_bloc.dart';

// создаем state c  copyWith что бы других не вбрысавал UI чтобы безопосно получать данных и обработавать данных


class NewsState {
  final List<NewTodayModel> newTodayList;
  final List<NewTodayModel> getAll;
  final List<SearchResultModel> searchResult;


  final String? error;
  final bool isLoading;
  final bool isLoadingAll;
  final String? errorAll;

  NewsState({
    this.newTodayList = const [],
    this.getAll = const [],
    this.searchResult = const [],

    this.error,
    this.errorAll,
    this.isLoading = false,
    this.isLoadingAll = false,
  });
  NewsState copyWith({
    List<NewTodayModel>? newTodayList,
    List<NewTodayModel>? getAll,
    List<SearchResultModel>? searchResult,

    String? error,
    bool? isLoading,
    String? errorAll,
    bool? isLoadingAll,
  }) {
    return NewsState(
      newTodayList: newTodayList ?? this.newTodayList,
      searchResult: searchResult ?? this.searchResult,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      getAll: getAll ?? this.getAll,
      errorAll: errorAll ?? this.errorAll,
      isLoadingAll: isLoadingAll ?? this.isLoadingAll,
    );
  }
}
