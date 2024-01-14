part of 'auth_bloc.dart';

// создадим из каждого auth event

@immutable
sealed class AuthEvent {}

// sigin in
class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignInEvent({required this.email, required this.password});
}

// register
class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  AuthSignUpEvent({required this.email, required this.password});
}

// create user после регистрация 
class CreateDetailUserEvent extends AuthEvent {
  final String username;
  CreateDetailUserEvent({
    required this.username,
  });
}
