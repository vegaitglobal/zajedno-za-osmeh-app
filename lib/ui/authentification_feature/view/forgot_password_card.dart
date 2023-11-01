import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/authentication/bloc/authentication_bloc.dart';
import 'package:gu_mobile/ui/authentification_feature/components/auth_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../resources/my_colors.dart';

class ForgotPasswordCard extends StatefulWidget {
  const ForgotPasswordCard({super.key});

  @override
  State<ForgotPasswordCard> createState() => _ForgotPasswordCardState();
}

class _ForgotPasswordCardState extends State<ForgotPasswordCard> {
  Key formKey = GlobalKey();
  bool isEmailValid = false;

  bool validateEmail(String email) {
    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegExp.hasMatch(email);
  }

  String email = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Zaboravljena lozinka',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.royalBlue,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icons/info.png'),
              const SizedBox(
                width: 16,
              ),
              const Expanded(
                  child: Text(
                'Unesite vašu email adresu na koju ćemo vam poslati dalje korake za resetovanje lozinke',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
            ],
          ),
        ),
        const SizedBox(height: 30),
        Form(
          key: formKey,
          child: AuthCard(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    isEmailValid = validateEmail(value);
                    email = value;
                  });
                },
                initialValue: email,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.textColor,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  label: const Text('Email adresa'),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: isEmailValid
                    ? () {
                        context
                            .read<AuthenticationBloc>()
                            .add(ResetPasswordEvent(email));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              "Email za resetovanje lozinke vam je poslat."),
                        ));
                      }
                    : null,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: isEmailValid
                        ? AppColors.buttonEnabled
                        : AppColors.buttonDisabled,
                  ),
                  child: const Text(
                    'Pošalji zahtev',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
