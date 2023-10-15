import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gu_mobile/data/authentication/authentication_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationRepository repository})
      : super(const AuthLoginState()) {
    RegistrationInformation? _registrationData;

    on<SignInEvent>((event, emit) async {
      try {
        await repository.signIn(email: event.email, password: event.password);
        emit (const UserLoggedInState());
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
        await repository.signUp(
            email: _registrationData!.email,
            password: _registrationData!.password);

        emit(const RegistrationCompleteState());
      } catch (e) {
        emit(const AuthErrorState());
      }
    });

    on<BackButtonPressedEvent>((event, emit) async {
      if (state is AuthRegistrationState) {
        emit(const AuthLoginState());
      } else if (state is AuthFinalRegistrationState) {
        emit(AuthRegistrationState(_registrationData?.email, _registrationData?.password));
      }
    });
  }
}

class RegistrationInformation {
  String email;
  String password;

  RegistrationInformation({required this.email, required this.password});
}
