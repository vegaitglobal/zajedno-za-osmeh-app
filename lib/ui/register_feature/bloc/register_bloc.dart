import 'package:bloc/bloc.dart';
import 'package:gu_mobile/data/authentication/i_authentication_repository.dart';
import 'package:image_picker/image_picker.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUiModel _uiModel = RegisterUiModel.initial();
  late IAuthenticationRepository _repo;

  RegisterBloc({required IAuthenticationRepository repository})
      : super(RegisterFormState(uiModel: RegisterUiModel.initial())) {
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

  _validateEmail(Emitter<RegisterState> emit, String email) {
    _uiModel = _uiModel.copyWith(
      email: email,
      emailValid: checkEmailValidationRules(email),
    );
    emit(RegisterFormState(uiModel: _uiModel));
  }

  _registerUser(Emitter<RegisterState> emit) async {
    if (_formRequirementsSatisfied()) {
      emit(LoadingState());
      // await _repo
      //     .signUp(email: _uiModel.email, password: _uiModel.password)
      //     .then((value) => {emit(UserRegisterSuccess())})
      //     .catchError(
      //   (onError) {
      //     emit(UserRegisterFailure("Dogodila se greska, probajte kasnije"));
      //   },
      // );
      await Future.delayed(Duration(seconds: 2)); // Wait for 2 seconds
      emit(UserRegisterSuccess(showToast: true));
      // repo.signUpWithVerification(email: email, password: password, filePath: filePath)
      // await userRepository
      //     .registerUser(
      //       state.name,
      //       state.lastName,
      //       state.email,
      //       state.password,
      //     )
      //     .then((response) => {})
      //     .catchError(
      //       (exception) => {
      //
      //       },
      //     );
    }
  }

  _validatePasswords(Emitter<RegisterState> emit, String value) {
    _uiModel = _uiModel.copyWith(
      passwordValid: checkPasswordValidationRules(value),
      password: value,
    );

    if (_uiModel.confirmedPassword.isNotEmpty) {
      _comparePasswords(emit, _uiModel.confirmedPassword);
    }
    emit(RegisterFormState(uiModel: _uiModel));
  }

  void _comparePasswords(Emitter<RegisterState> emit, String value) {
    _uiModel = _uiModel.copyWith(
      confirmedPassword: value,
      passwordMatch: _passwordsMatch(value) ? true : false,
    );
    emit(RegisterFormState(uiModel: _uiModel));
  }

  _checkPasswordMatching(Emitter<RegisterState> emit, String value) =>
      _comparePasswords(emit, value);

  _hidePasswordFieldValues(Emitter<RegisterState> emit) {
    _uiModel = _uiModel.copyWith(
      hidePassword: !_uiModel.hidePassword,
    );
    emit(RegisterFormState(uiModel: _uiModel));
  }

  _updateName(Emitter<RegisterState> emit, String value) {
    _uiModel = _uiModel.copyWith(
      name: value,
    );
    emit(RegisterFormState(uiModel: _uiModel));
  }

  _updateLastname(Emitter<RegisterState> emit, String value) {
    _uiModel = _uiModel.copyWith(lastName: value);
    emit(RegisterFormState(uiModel: _uiModel));
  }

  bool _passwordsMatch(String value) => _uiModel.password == value;

  bool _formRequirementsSatisfied() =>
      _uiModel.emailValid &&
      _uiModel.passwordValid &&
      _uiModel.passwordsMatch &&
      _uiModel.password.isNotEmpty &&
      _uiModel.email.isNotEmpty;

  void _uploadFile(Emitter<RegisterState> emit) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      _uiModel = _uiModel.copyWith(
        filePath: image?.path,
        fileName: image?.name,
      );
      emit(FileUploaded(uiModel: _uiModel));
    } catch (exception) {
      print("=======>>>> exception occurred $exception");
      emit(FileUploadError());
    }
  }

  _sendDocumentation(Emitter<RegisterState> emit) async {
    try {
      await _repo.signUpWithVerification(
          email: _uiModel.email,
          password: _uiModel.password,
          filePath: _uiModel.filePath);
      emit(SendingDocumentationSuccess(showToast: true));
    } catch (exception) {
      print("=======>>>> exception occurred $exception");
      emit(SendingDocumentationError());
    }
  }

  _dispatchNavigationBack(Emitter<RegisterState> emit) {
    switch (state) {
      case FileUploaded():
      case FileUploadError():
      case UserRegisterFailure():
      case LoadingState():
      case NavigateBack():
      case SendingDocumentationError():
        break;
      case RegisterFormState():
        {
          emit(NavigateBack());
          emit(RegisterFormState(uiModel: _uiModel));
          break;
        }
      case UserRegisterSuccess():
        {
          emit(RegisterFormState(uiModel: _uiModel));
          break;
        }
      case SendingDocumentationSuccess():
        {
          emit(UserRegisterSuccess(showToast: false));
          break;
        }
    }
  }
}

class RegisterUiModel {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String confirmedPassword;
  final String fileName;
  final String filePath;
  final bool hidePassword;
  final bool passwordValid;
  final bool passwordsMatch;
  final bool emailValid;

  factory RegisterUiModel.initial() => RegisterUiModel(
        name: '',
        lastName: '',
        email: '',
        password: '',
        confirmedPassword: '',
        fileName: '',
        filePath: '',
        hidePassword: true,
        passwordValid: true,
        passwordsMatch: true,
        emailValid: true,
      );

  RegisterUiModel({
    required this.fileName,
    required this.filePath,
    required this.emailValid,
    required this.passwordValid,
    required this.passwordsMatch,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmedPassword,
    required this.hidePassword,
  });

  RegisterUiModel copyWith({
    String? name,
    String? lastName,
    String? email,
    String? password,
    String? confirmedPassword,
    String? fileName,
    String? filePath,
    bool? hidePassword,
    bool? passwordValid,
    bool? passwordMatch,
    bool? emailValid,
  }) {
    return RegisterUiModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      hidePassword: hidePassword ?? this.hidePassword,
      passwordValid: passwordValid ?? this.passwordValid,
      passwordsMatch: passwordMatch ?? this.passwordsMatch,
      emailValid: emailValid ?? this.emailValid,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
    );
  }
}

sealed class RegisterState {
  RegisterState();
}

class FileUploaded extends RegisterState {
  final RegisterUiModel uiModel;

  FileUploaded({required this.uiModel}) : super();
}

class FileUploadError extends RegisterState {
  FileUploadError() : super();
}

class UserRegisterSuccess extends RegisterState {
  bool showToast;

  UserRegisterSuccess({required this.showToast}) : super();
}

class UserRegisterFailure extends RegisterState {
  final String message;

  UserRegisterFailure(this.message) : super();
}

class LoadingState extends RegisterState {
  LoadingState() : super();
}

class RegisterFormState extends RegisterState {
  final RegisterUiModel uiModel;

  RegisterFormState({required this.uiModel}) : super();
}

class SendingDocumentationError extends RegisterState {
  SendingDocumentationError() : super();
}

class SendingDocumentationSuccess extends RegisterState {
  bool showToast;

  SendingDocumentationSuccess({required this.showToast}) : super();
}

class NavigateBack extends RegisterState {
  NavigateBack() : super();
}
// end-region state

// region event
class PreformUserRegistrationEvent extends RegisterEvent {
  const PreformUserRegistrationEvent();
}

class EmailChanged extends RegisterEvent {
  String value;

  EmailChanged(this.value);
}

class PasswordChanged extends RegisterEvent {
  String value;

  PasswordChanged(this.value);
}

class PasswordConfirmed extends RegisterEvent {
  String value;

  PasswordConfirmed(this.value);
}

class HidePassword extends RegisterEvent {
  HidePassword();
}

class NameChanged extends RegisterEvent {
  String value;

  NameChanged(this.value);
}

class LastnameChanged extends RegisterEvent {
  String value;

  LastnameChanged(this.value);
}

class UploadFile extends RegisterEvent {
  UploadFile() : super();
}

class SendDocumentation extends RegisterEvent {
  SendDocumentation() : super();
}

class OnBackPressed extends RegisterEvent {
  OnBackPressed() : super();
}

sealed class RegisterEvent {
  const RegisterEvent();
}

const _keyDataName = "name";
const _keyDataLastname = "lastname";

const String _passwordValidRegex = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$';
const String _emailValidRegex = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
