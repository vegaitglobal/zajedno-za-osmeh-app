part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}


final class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password);
}

final class EnterUserInformationEvent extends AuthenticationEvent {
  final String email;
  final String password;

  const EnterUserInformationEvent(this.email, this.password);
}

final class CompleteSignUpEvent extends AuthenticationEvent {
  const CompleteSignUpEvent();
}

final class RegistrationCompleteEvent extends AuthenticationEvent {
  const RegistrationCompleteEvent();
}

final class BackButtonPressedEvent extends AuthenticationEvent {
  const BackButtonPressedEvent();
}