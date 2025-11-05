part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginError extends AuthenticationState {
  final String messege;

  LoginError(this.messege);
}

final class SignUpSuccess extends AuthenticationState {}

final class SignUpLoading extends AuthenticationState {}

final class SignUpError extends AuthenticationState {
  final String message;
  SignUpError(this.message);
}

final class GoogleSignInSuccess extends AuthenticationState {}

final class GooglelSignInLoding extends AuthenticationState {}

final class GooglelSignInError extends AuthenticationState {}

final class GooglelSignIn extends AuthenticationState {}

final class LogoutLoading extends AuthenticationState {}

final class LogoutSuccess extends AuthenticationState {}

final class LogoutError extends AuthenticationState {}

final class PasswordResetLoading extends AuthenticationState {}

final class PasswordResetSuccess extends AuthenticationState {}

final class PasswordResetErorr extends AuthenticationState {}

final class UserDataAdeddLoading extends AuthenticationState {}

final class UserDataAdeddSuccess extends AuthenticationState {}

final class UserDataAdeddErorr extends AuthenticationState {}

final class GetUserDataLoading extends AuthenticationState {}

final class GetUserDataSuccess extends AuthenticationState {}

final class GetUserDataErorr extends AuthenticationState {}
