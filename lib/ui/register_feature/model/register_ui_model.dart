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
