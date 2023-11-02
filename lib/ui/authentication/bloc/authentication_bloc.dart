import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required IAuthenticationRepository repository})
      : super(const AuthLoginState()) {
    RegistrationInformation? _registrationData;
    StreamSubscription<AuthChangeEvent?>? _authChangesSubscription;

    void startUserSubscription() => _authChangesSubscription =
            repository.getAuthStateChanges().listen((authState) {
          if (authState == AuthChangeEvent.passwordRecovery) {
            add(const SwitchToUpdatePassScreen());
          }
        });

    startUserSubscription();

    on<SignInEvent>((event, emit) async {
      try {
        await repository.signIn(email: event.email, password: event.password);
        emit(const UserLoggedInState());
        emit(const AuthLoginState());
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<EnterUserInformationEvent>((event, emit) async {
      _registrationData =
          RegistrationInformation(email: event.email, password: event.password);

      emit(const AuthFinalRegistrationState());
    });

    on<CompleteSignUpEvent>((event, emit) async {
      try {
        if (_registrationData == null) {
          emit(const AuthErrorState());
        }
        await repository.signUpWithVerification(
            email: _registrationData!.email,
            password: _registrationData!.password,
            filePath: event.filePath);

        emit(const RegistrationCompleteState());
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<BackButtonPressedEvent>((event, emit) async {
      if (state is AuthRegistrationState || state is ForgotenPasswordState) {
        emit(const AuthLoginState());
      } else if (state is AuthFinalRegistrationState) {
        emit(AuthRegistrationState(
            _registrationData?.email, _registrationData?.password));
      } else if (state is UpdatePasswordState) {
        await repository.signOut();
        emit(const AuthLoginState());
        emit(const UserLoggedOutState());
      }
    });

    on<SwitchToSignUpScreen>((event, emit) async {
      emit(const AuthRegistrationState(null, null));
      emit(const AuthLoginState());
    });

    on<SwitchToForgotPassScreen>((event, emit) async {
      emit(const ForgotenPasswordState());
    });

    on<SignOutEvent>((event, emit) async {
      try {
        await repository.signOut();
        emit(const UserLoggedOutState());
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      try {
        await repository.resetPassword(event.email);
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<UpdatePasswordEvent>((event, emit) async {
      try {
        await repository.updatePassword(event.newPassword);
        emit(const AuthLoginState());
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<SwitchToUpdatePassScreen>((event, emit) async {
      emit(const UpdatePasswordState());
    });

    @override
    Future<void> close() {
      _authChangesSubscription?.cancel();
      return super.close();
    }
  }
}

class RegistrationInformation {
  String email;
  String password;

  RegistrationInformation({required this.email, required this.password});
}
