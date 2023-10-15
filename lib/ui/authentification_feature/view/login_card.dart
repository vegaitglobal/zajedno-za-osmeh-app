import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/authentification_feature/components/auth_card.dart';

import '../../../resources/my_colors.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  Key formKey = GlobalKey();
  bool shouldObscureText = true;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    bool submitEnabled = email.isNotEmpty && password.isNotEmpty;
    return Column(
      children: [
        Center(
          child: Text(
            'Prijava',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: formKey,
          child: AuthCard(children: [
            TextFormField(
              onChanged: (value) => setState(() {
                email = value;
              }),
              initialValue: email,
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
            const SizedBox(
              height: 30,
            ),
            Stack(children: [
              TextFormField(
                onChanged: (value) => setState(() {
                  password = value;
                }),
                initialValue: password,
                obscureText: shouldObscureText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    label: const Text('Lozinka'),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      shouldObscureText = !shouldObscureText;
                    });
                  },
                  icon: Icon(shouldObscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  color: AppColors.clientOrange,
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // TODO: switch to forgot password
                },
                child: Text(
                  'Zaboravljena lozinka',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.clientOrange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: submitEnabled
                    ? () {
                        // TODO: submit button
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
                    color: submitEnabled
                        ? AppColors.buttonEnabled
                        : AppColors.buttonDisabled,
                  ),
                  child: const Text(
                    'Prijavi se',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )),
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Nemate nalog?',
          style: TextStyle(fontSize: 14),
        ),
        GestureDetector(
          onTap: () {
            // TODO: change to registration
          },
          child: Text(
            'napravite nalog kao korisnik usluga',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.clientOrange,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
