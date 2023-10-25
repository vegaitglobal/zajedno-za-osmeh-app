import 'package:gu_mobile/ui/register_feature/model/register_ui_model.dart';

sealed class RegisterStateEvent {
  RegisterStateEvent();
}

sealed class RegisterState extends RegisterStateEvent {
  RegisterState() : super();
}

sealed class RegisterEffect extends RegisterStateEvent {
  RegisterEffect() : super();
}

class RegisterFormView extends RegisterState {
  final RegisterUiModel uiModel;

  RegisterFormView({required this.uiModel}) : super();
}

class UploadDocView extends RegisterState {
  UploadDocView() : super();
}

class RegistrationFinishedView extends RegisterState {
  RegistrationFinishedView() : super();
}

class LoadingView extends RegisterState {
  LoadingView() : super();
}

class FileUploadedView extends RegisterState {
  final RegisterUiModel uiModel;

  FileUploadedView({required this.uiModel}) : super();
}

class FileUploadError extends RegisterEffect {
  FileUploadError() : super();
}

class UserRegisterSuccess extends RegisterEffect {
  UserRegisterSuccess() : super();
}

class UserRegisterFailure extends RegisterEffect {
  final String message;

  UserRegisterFailure(this.message) : super();
}

class SendDocumentError extends RegisterEffect {
  SendDocumentError() : super();
}

class SendDocumentSuccess extends RegisterEffect {
  SendDocumentSuccess() : super();
}

class NavigateBack extends RegisterEffect {
  NavigateBack() : super();
}
