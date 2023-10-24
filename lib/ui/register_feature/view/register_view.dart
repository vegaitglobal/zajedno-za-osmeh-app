import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/theme/color.dart';

import '../../../resources/my_colors.dart';
import '../../common/custom_bottom_navigation_bar.dart';
import '../bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: GestureDetector(
          onTap: () {
            context.read<RegisterBloc>().add(OnBackPressed());
          },
          child: Container(
            margin: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Image.asset('assets/images/icons/arrow.png'),
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
      ),
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        buildWhen: (previousState, currentState) {
          if (currentState is RegisterFormState ||
              currentState is LoadingState ||
              currentState is UserRegisterSuccess ||
              currentState is FileUploaded ||
              currentState is SendingDocumentationSuccess) {
            return true;
          } else {
            return false;
          }
        },
        listenWhen: (previousState, currentState) {
          if (currentState is UserRegisterSuccess ||
              currentState is UserRegisterFailure ||
              currentState is SendingDocumentationError ||
              currentState is SendingDocumentationSuccess ||
              currentState is NavigateBack) {
            return true;
          } else {
            return false;
          }
        },
        listener: (context, state) {
          if (state is NavigateBack) {
            context.go(AppRoutes.authentification.path());
          }

          if (state is UserRegisterSuccess && state.showToast) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Verifikacioni email je poslat!"),
            ));
          }
          if (state is UserRegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Doslo je do greske, probajte kasnije"),
            ));
          }

          if (state is SendingDocumentationError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Doslo je do greske prilikom slanja dokumentacije, molimo vas probajte opet!"),
            ));
          }

          if (state is SendingDocumentationSuccess && state.showToast) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Vas dokument je uspesno poslat!"),
            ));
          }
        },
        builder: (
          BuildContext context,
          RegisterState state,
        ) {
          return SafeArea(
            child: Column(
              children: [
                _registrationLabel(),
                switch (state) {
                  LoadingState() =>
                    const Center(child: CircularProgressIndicator()),
                  RegisterFormState() => _registerForm(context, state),
                  UserRegisterSuccess() => _uploadFileForm(context, state),
                  FileUploaded() => _uploadFileForm(context, state),
                  SendingDocumentationSuccess() =>
                    _registrationFinished(context),
                  UserRegisterFailure() => Container(),
                  FileUploadError() => Container(),
                  SendingDocumentationError() => Container(),
                  NavigateBack() => Container(),
                }
              ],
            ),
          );
        },
      ),
    );
  }

  Padding _registerForm(BuildContext context, RegisterFormState state) {
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
      BuildContext context, RegisterFormState state) {
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

  TextFormField _passwordInput(RegisterFormState state, BuildContext context) {
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

  IconButton _hidePasswordButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.visibility),
      onPressed: () => context.read<RegisterBloc>().add(HidePassword()),
    );
  }

  TextFormField _emailInput(BuildContext context, RegisterFormState state) {
    return TextFormField(
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
  }

  TextFormField _lastnameInput(BuildContext context, RegisterFormState state) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Prezime"),
      ),
      onChanged: (value) =>
          context.read<RegisterBloc>().add(LastnameChanged(value)),
    );
  }

  TextFormField _nameInput(BuildContext context, RegisterFormState state) {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text("Ime"),
      ),
      onChanged: (value) =>
          context.read<RegisterBloc>().add(NameChanged(value)),
    );
  }

  Widget _uploadFileForm(BuildContext context, RegisterState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.royalBlue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded, color: Colors.orange),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                Text(
                  'U sledecem koraku ce biti\npotrebno priloziti izvestaj lekara',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          const Text("Prilozite izvestaj lekara"),
          SizedBox(

            width: double.infinity,
            child: DottedBorder(
              strokeWidth: 1.0,
              radius: const Radius.circular(8.0),
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  if (state is UserRegisterSuccess)
                    Image.asset('assets/images/icons/upload_file.png')
                  else
                    const Icon(Icons.check_circle_outline, color: Colors.green),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  if (state is UserRegisterSuccess)
                    _uploadFileTextButton(context),
                  if (state is FileUploaded) Text(state.uiModel.fileName),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  if (state is UserRegisterSuccess)
                    const Text("Potrebno je priloziti fotografiju dokumenta"),
                  if (state is FileUploaded)
                    const Text("Dokument uspesno ucitan"),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                ],
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: _buttonStyleOnStateChange(state),
              onPressed: () {
                if (state is FileUploaded) {
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
    );
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
    if (state is FileUploaded) {
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
                onPressed: () => context
                    .read<RegisterBloc>()
                    .add(const PreformUserRegistrationEvent()),
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
