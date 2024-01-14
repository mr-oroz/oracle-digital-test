part of 'person_bloc.dart';

// создаем state c  copyWith что бы других не вбрысавал UI чтобы безопосно получать данных и обработавать данных

class PersonState {
  final List<NewTodayModel> images; 


  final String? error;
  final bool isLoading;

  PersonState({
    this.images = const [],
    this.error,
    this.isLoading = false,

  });
  PersonState copyWith({
    List<NewTodayModel>? images,
    List<NewTodayModel>? newTodayList,
    String? error,
    bool? isLoading,

  }) {
    return PersonState(
      images: images ?? this.images,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,


    );
  }
}
