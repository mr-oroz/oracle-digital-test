part of 'auth_bloc.dart';



// создадим из каждого auth state c обработками 
@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSignInSuccess extends AuthState{}
class AuthSignInLoading extends AuthState{}
class AuthSignInError extends AuthState{
  final String error;
  AuthSignInError(this.error);
}

class AuthSignUpSuccess extends AuthState{}
class AuthSignUpLoading extends AuthState{}
class AuthSignUpError extends AuthState{
  final String error;
  AuthSignUpError(this.error);
}

class CreateDetailUserSuccess extends AuthState{}
class CreateDetailUserLoading extends AuthState{}
class CreateDetailUserError extends AuthState{
  final String error;
  CreateDetailUserError(this.error);
}




