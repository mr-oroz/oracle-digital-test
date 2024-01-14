import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oracle_digital/presentation/firebase/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.auth}) : super(AuthInitial()) {
    // на логин
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthSignInLoading());
      try {
        await auth.signIn(event.email, event.password);
        emit(AuthSignInSuccess());
      } catch (e) {
        emit(AuthSignInError(e.toString()));
      }
    });

    // на регистрация
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthSignUpLoading());
      try {
        await auth.register(event.email, event.password);
        emit(AuthSignUpSuccess());
      } catch (e) {
        emit(AuthSignUpError(e.toString()));
      }
    });

    // на создания южер
    // тут такая логика работает мы после регистрация получаем userId и сохраняем его на хранилище и потом сюда получаю и отправляю на сервер на зарегистрированного пользователя использовал sharedPreferences
    on<CreateDetailUserEvent>((event, emit) async {
      emit(CreateDetailUserLoading());
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final userId = prefs.getString('isUserId');
        if (userId != null) {
          await auth.addDetailUserName(userId, event.username);
          emit(CreateDetailUserSuccess());
        }
      } catch (e) {
        emit(AuthSignUpError(e.toString()));
      }
    });
  }
  final FirebaseService auth;
}
