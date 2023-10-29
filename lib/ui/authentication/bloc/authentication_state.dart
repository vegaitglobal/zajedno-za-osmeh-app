part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthInitialState extends AuthenticationState {}

final class AuthLoginState extends AuthenticationState {
  const AuthLoginState();
}

final class AuthRegistrationState extends AuthenticationState {
  final String? email;
  final String? password;

  const AuthRegistrationState(this.email, this.password);
}

final class AuthFinalRegistrationState extends AuthenticationState {
  const AuthFinalRegistrationState();
}

final class UserLoggedInState extends AuthenticationState {
  const UserLoggedInState();
}

final class RegistrationCompleteState extends AuthenticationState {
  const RegistrationCompleteState();
}

final class AuthErrorState extends AuthenticationState {
  const AuthErrorState();
}

final class UserLoggedOutState extends AuthenticationState {
  const UserLoggedOutState();
}
