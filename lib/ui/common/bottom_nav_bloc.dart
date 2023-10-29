import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';

import '../../data/authentication/model/UserSession.dart';

class BottomNavBloc extends Bloc<void, SessionUiState> {
  BottomNavBloc({required IAuthenticationRepository authRepository})
      : super(UnauthorizedSession()) {
    emitInitialState(authRepository);
    updateUiStateOnSessionChange(authRepository);
  }

  void emitInitialState(IAuthenticationRepository authRepository) async {
    UserSession session = await authRepository.getCurrentSession();
    emitStateOnSessionChange(session);
  }

  void emitStateOnSessionChange(UserSession event) {
    if (event is Authorized) {
      emit(AuthorizedSession());
    } else {
      emit(UnauthorizedSession());
    }
  }

  void updateUiStateOnSessionChange(IAuthenticationRepository authRepository) =>
      authRepository.observeSessionState().stream.listen((event) {
        emitStateOnSessionChange(event);
      });
}

sealed class SessionUiState {}

class AuthorizedSession extends SessionUiState {}

class UnauthorizedSession extends SessionUiState {}
