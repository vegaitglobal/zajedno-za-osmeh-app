import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/theme/color.dart';

import '../../../resources/my_colors.dart';
import '../../common/custom_bottom_navigation_bar.dart';
import '../bloc/register_bloc.dart';
import '../model/register_event.dart';
import '../model/register_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterBloc, RegisterStateEvent>(
          buildWhen: (previousState, currentState) =>
              _configureBuilderExecutionForState(currentState),
          listenWhen: (previousState, currentState) =>
              _configureListenerExecutionOnEffect(currentState),
          listener: (context, state) {
            _onNavigateBackEffect(state, context);
            _onUserRegisterSuccessEffect(state, context);
            _onUserRegisterFailureEffect(state, context);
            _onSendDocumentErrorEffect(state, context);
            _onSendDocumentSuccessEffect(state, context);
          },
          builder: (BuildContext context, RegisterStateEvent state) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _registrationLabel(),
                  switch (state) {
                    LoadingView() => const CircularProgressIndicator(),
                    RegisterFormView() => _registerForm(context, state),
                    UploadDocView() => _uploadFileForm(context, state),
                    FileUploadedView() => _uploadFileForm(context, state),
                    RegistrationFinishedView() =>
                      _registrationFinished(context),
                    RegisterEffect() => Container(),
                  },
                  Container(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  bool _configureListenerExecutionOnEffect(RegisterStateEvent currentState) {
    if (currentState is RegisterEffect) {
      return true;
    } else {
      return false;
    }
  }

  bool _configureBuilderExecutionForState(RegisterStateEvent currentState) {
    if (currentState is RegisterState) {
      return true;
    } else {
      return false;
    }
  }

  void _onSendDocumentSuccessEffect(
      RegisterStateEvent state, BuildContext context) {
    if (state is SendDocumentSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Vas dokument je uspesno poslat!"),
      ));
    }
  }

  void _onSendDocumentErrorEffect(
      RegisterStateEvent state, BuildContext context) {
    if (state is SendDocumentError) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            "Došlo je do greške prilikom slanja dokumentacije, molimo vas probajte opet!"),
      ));
    }
  }

  void _onUserRegisterFailureEffect(
      RegisterStateEvent state, BuildContext context) {
    if (state is UserRegisterFailure) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Došlo je do greške, probajte kasnije"),
      ));
    }
  }

  void _onUserRegisterSuccessEffect(
      RegisterStateEvent state, BuildContext context) {
    if (state is UserRegisterSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Verifikacioni email je poslat!"),
      ));
    }
  }

  void _onNavigateBackEffect(RegisterStateEvent state, BuildContext context) {
    if (state is NavigateBack) {
      context.go(AppRoutes.authentification.path());
    }
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 150,
      leading: GestureDetector(
        onTap: () => context.read<RegisterBloc>().add(OnBackPressed()),
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/arrow_left.svg'),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Nazad',
                style: TextStyle(fontSize: 14, color: AppColors.royalBlue),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _registerForm(BuildContext context, RegisterFormView state) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 26.0,
        horizontal: 26.0,
      ),
      child: Wrap(
        runSpacing: 14,
        alignment: WrapAlignment.center,
        children: [
          _nameInput(context, state),
          _lastnameInput(context, state),
          _emailInput(context, state),
          _passwordInput(state, context),
          _passwordRulesInfoLabel(),
          _confirmPasswordInput(context, state),
          _registerButton(context: context),
        ],
      ),
    );
  }

  TextFormField _confirmPasswordInput(
      BuildContext context, RegisterFormView state) {
    return TextFormField(
      obscureText: state.uiModel.hidePassword,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorText:
            !state.uiModel.passwordsMatch ? "Lozinke se ne poklapaju" : null,
        border: const OutlineInputBorder(),
        label: const Text("Ponovi lozinku"),
      ),
      onChanged: (value) =>
          context.read<RegisterBloc>().add(PasswordConfirmed(value)),
    );
  }

  Text _registrationLabel() => const Text(
        "Registracija",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );

  TextFormField _passwordInput(RegisterFormView state, BuildContext context) {
    return TextFormField(
      obscureText: state.uiModel.hidePassword,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        errorText:
            !state.uiModel.passwordValid ? "Lozinka nije ispravna" : null,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        suffixIcon: _hidePasswordButton(context),
        border: const OutlineInputBorder(),
        label: const Text("Lozinka"),
      ),
      onChanged: (value) =>
          context.read<RegisterBloc>().add(PasswordChanged(value)),
    );
  }

  _hidePasswordButton(BuildContext context) => IconButton(
        icon: const Icon(Icons.visibility),
        onPressed: () => context.read<RegisterBloc>().add(HidePassword()),
      );

  _emailInput(BuildContext context, RegisterFormView state) => TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          errorText:
              !state.uiModel.emailValid ? "Email adresa nije ispravna" : null,
          border: const OutlineInputBorder(),
          label: const Text("Email adresa"),
        ),
        onChanged: (value) =>
            context.read<RegisterBloc>().add(EmailChanged(value)),
      );

  _lastnameInput(BuildContext context, RegisterFormView state) => TextFormField(
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Prezime"),
        ),
        onChanged: (value) =>
            context.read<RegisterBloc>().add(LastnameChanged(value)),
      );

  _nameInput(BuildContext context, RegisterFormView state) => TextFormField(
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Ime"),
        ),
        onChanged: (value) =>
            context.read<RegisterBloc>().add(NameChanged(value)),
      );

  _uploadFileForm(BuildContext context, RegisterState state) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 180),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.royalBlue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/icons/info.png'),
                  const Padding(padding: EdgeInsets.only(left: 10.0)),
                  const Text(
                    'U sledecem koraku ce biti\npotrebno priloziti izvestaj lekara',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Prilozite izvestaj lekara"),
                  SizedBox(
                      width: double.infinity,
                      child: _dottedContainer(context, state)),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 32.0)),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: _buttonStyleOnStateChange(state),
                      onPressed: () {
                        if (state is FileUploadedView) {
                          context.read<RegisterBloc>().add(SendDocumentation());
                        }
                      },
                      child: const Text(
                        "Posalji zahtev",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _uploadedFileNamePlaceholder(RegisterState state) {
    if (state is UploadDocView) {
      return const Text("Potrebno je priloziti fotografiju dokumenta");
    }
    if (state is FileUploadedView) {
      return const Text("Dokument uspesno ucitan");
    }
  }

  _uploadFileClickableText(BuildContext context, RegisterState state) {
    if (state is UploadDocView) {
      return _uploadFileTextButton(context);
    }
    if (state is FileUploadedView) {
      return Text(state.uiModel.fileName);
    }
  }

  DottedBorder _dottedContainer(BuildContext context, RegisterState state) =>
      DottedBorder(
        strokeWidth: 1,
        color: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _fileUploadIndicatorIcon(state),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              _uploadFileClickableText(context, state),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              _uploadedFileNamePlaceholder(state),
            ],
          ),
        ),
      );

  _fileUploadIndicatorIcon(RegisterState state) {
    if (state is UploadDocView) {
      return SvgPicture.asset('assets/icons/upload_file.svg');
    } else {
      return const Icon(
        Icons.check_circle_outline,
        color: Colors.green,
      );
    }
  }

  Row _uploadFileTextButton(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () {
              context.read<RegisterBloc>().add(UploadFile());
            },
            child: const Text(
              "Klikni ",
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ),
        const Text("da odaberes fajl iz galerije")
      ],
    );
  }

  Widget _passwordRulesInfoLabel() => const Text(
        "Lozinka mora da sadrži najmanje 8 karaktera, jedno malo i veliko slovo i jedan broj",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
      );

  Widget _registerButton({required BuildContext context}) => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Green),
          ),
          onPressed: () => context
              .read<RegisterBloc>()
              .add(const PreformUserRegistrationEvent()),
          child: const Text(
            "Potvrdi i nastavi",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );

  _buttonStyleOnStateChange(RegisterState state) {
    if (state is FileUploadedView) {
      return ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Green));
    } else {
      return ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey));
    }
  }

  Widget _registrationFinished(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(_registration_confirmation_text),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Green),
                ),
                onPressed: () =>
                    {context.read<RegisterBloc>().add(OnBackPressed())},
                child: const Text(
                  "Zavrsi i idi na pocetnu stranu",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

const _registration_confirmation_text =
    "Primili smo Vaš zahtev za registraciju, nas admin tim ce pregledati Vašu prijavu "
    "i dobićete potvrdu na unetu email adresu da li je Vaš zahtev prihvaćen.\n\n"
    "Ukoliko Vaša prijava bude privaćena, na aplikaciji će Vam biti dostupan QR "
    "kod koji možete prikazati prilikom korišćenja povlašćenih usluga.";
