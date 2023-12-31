part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
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
  final String filePath;

  const CompleteSignUpEvent(this.filePath);
}

final class RegistrationCompleteEvent extends AuthenticationEvent {
  const RegistrationCompleteEvent();
}

final class BackButtonPressedEvent extends AuthenticationEvent {
  const BackButtonPressedEvent();
}

final class SwitchToSignUpScreen extends AuthenticationEvent {
  const SwitchToSignUpScreen();
}

final class SwitchToForgotPassScreen extends AuthenticationEvent {
  const SwitchToForgotPassScreen();
}

final class SwitchToUpdatePassScreen extends AuthenticationEvent {
  const SwitchToUpdatePassScreen();
}

class SignOutEvent extends AuthenticationEvent {
  const SignOutEvent();
}

class ResetPasswordEvent extends AuthenticationEvent {
  final String email;
  const ResetPasswordEvent(this.email);
}

class UpdatePasswordEvent extends AuthenticationEvent {
  final String newPassword;
  const UpdatePasswordEvent(this.newPassword);
}
