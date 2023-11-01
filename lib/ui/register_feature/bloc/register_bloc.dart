import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../model/register_event.dart';
import '../model/register_state.dart';
import '../model/register_ui_model.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStateEvent> {
  RegisterUiModel _uiModel = RegisterUiModel.initial();
  late IAuthenticationRepository _repo;

  RegisterBloc({required IAuthenticationRepository repository})
      : super(RegisterFormView(uiModel: RegisterUiModel.initial())) {
    _repo = repository;
    _consumeEvents();
  }

  void _consumeEvents() => on<RegisterEvent>(
        (event, emit) async => switch (event) {
          PreformUserRegistrationEvent() => _registerUser(emit),
          EmailChanged() => _validateEmail(emit, event.value),
          PasswordChanged() => _validatePasswords(emit, event.value),
          PasswordConfirmed() => _checkPasswordMatching(emit, event.value),
          HidePassword() => _hidePasswordFieldValues(emit),
          NameChanged() => _updateName(emit, event.value),
          LastnameChanged() => _updateLastname(emit, event.value),
          UploadFile() => _uploadFile(emit),
          SendDocumentation() => _sendDocumentation(emit),
          OnBackPressed() => _dispatchNavigationBack(emit),
        },
      );

  bool checkPasswordValidationRules(String password) {
    final pattern = RegExp(_passwordValidRegex);
    if (pattern.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool checkEmailValidationRules(String email) {
    final pattern = RegExp(_emailValidRegex, caseSensitive: false);
    if (pattern.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  void _validateEmail(Emitter<RegisterStateEvent> emit, String email) {
    _uiModel = _uiModel.copyWith(
      email: email,
      emailValid: checkEmailValidationRules(email),
    );
    emit(RegisterFormView(uiModel: _uiModel));
  }

  void _validatePasswords(Emitter<RegisterStateEvent> emit, String value) {
    _uiModel = _uiModel.copyWith(
      passwordValid: checkPasswordValidationRules(value),
      password: value,
    );

    if (_uiModel.confirmedPassword.isNotEmpty) {
      _comparePasswords(emit, _uiModel.confirmedPassword);
    }
    emit(RegisterFormView(uiModel: _uiModel));
  }

  void _comparePasswords(Emitter<RegisterStateEvent> emit, String value) {
    _uiModel = _uiModel.copyWith(
      confirmedPassword: value,
      passwordMatch: _passwordsMatch(value) ? true : false,
    );
    emit(RegisterFormView(uiModel: _uiModel));
  }

  void _checkPasswordMatching(Emitter<RegisterStateEvent> emit, String value) =>
      _comparePasswords(emit, value);

  void _hidePasswordFieldValues(Emitter<RegisterStateEvent> emit) {
    _uiModel = _uiModel.copyWith(
      hidePassword: !_uiModel.hidePassword,
    );
    emit(RegisterFormView(uiModel: _uiModel));
  }

  void _updateName(Emitter<RegisterStateEvent> emit, String value) {
    _uiModel = _uiModel.copyWith(
      name: value,
    );
    emit(RegisterFormView(uiModel: _uiModel));
  }

  void _updateLastname(Emitter<RegisterStateEvent> emit, String value) {
    _uiModel = _uiModel.copyWith(lastName: value);
    emit(RegisterFormView(uiModel: _uiModel));
  }

  bool _passwordsMatch(String value) => _uiModel.password == value;

  bool _formRequirementsAreSatisfied() =>
      _uiModel.emailValid &&
      _uiModel.passwordValid &&
      _uiModel.passwordsMatch &&
      _uiModel.password.isNotEmpty &&
      _uiModel.email.isNotEmpty;

  _registerUser(Emitter<RegisterStateEvent> emit) async {
    if (_formRequirementsAreSatisfied()) {
      emit(LoadingView());
      await _repo
          .signUp(email: _uiModel.email, password: _uiModel.password)
          .then((value) => {emit(UploadDocView()), emit(UserRegisterSuccess())})
          .catchError(
        (onError) {
          emit(UserRegisterFailure("Dogodila se greska, probajte kasnije"));
        },
      );
    }
  }

  void _uploadFile(Emitter<RegisterStateEvent> emit) async {
    try {
      print("=====>>>> uploading file");
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      _uiModel = _uiModel.copyWith(
        filePath: image?.path,
        fileName: image?.name,
      );
      if (image == null) {
        emit(FileUploadError());
      } else {
        emit(FileUploadedView(uiModel: _uiModel));
      }
    } catch (exception) {
      emit(FileUploadError());
    }
  }

  void _sendDocumentation(Emitter<RegisterStateEvent> emit) async {
    try {
      await _repo.signUpWithVerification(
          name: _uiModel.name,
          lastname: _uiModel.lastName,
          email: _uiModel.email,
          password: _uiModel.password,
          filePath: _uiModel.filePath);
      emit(RegistrationFinishedView());
      emit(SendDocumentSuccess());
    } catch (exception) {
      emit(SendDocumentError());
    }
  }

  void _dispatchNavigationBack(Emitter<RegisterStateEvent> emit) {
    emit(NavigateBack());
    emit(RegisterFormView(uiModel: _uiModel));
  }
}

const String _passwordValidRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';
const String _emailValidRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
