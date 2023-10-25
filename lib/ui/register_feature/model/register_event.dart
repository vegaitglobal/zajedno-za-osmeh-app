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