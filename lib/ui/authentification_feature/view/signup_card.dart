import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

import '../components/auth_card.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key, required this.onSubmit});

  final Function(String, String) onSubmit;

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  Key formKey = GlobalKey();

  bool shouldObscureTextPassword = true;
  bool shouldObscureTextRepeat = true;

  String firstName = '';
  String lastName = '';
  String password = '';
  String email = '';
  String passwordRepeated = '';

  @override
  Widget build(BuildContext context) {
    bool submitEnabled = email.isNotEmpty &&
        password.isNotEmpty &&
        passwordRepeated.isNotEmpty &&
        password == passwordRepeated;

    return Column(
      children: [
        Text(
          'Registracija',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: formKey,
          child: AuthCard(children: [
            // TextFormField(
            //   onChanged: (value) => setState(() {
            //     firstName = value;
            //   }),
            //   initialValue: firstName,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: AppColors.textColor,
            //         ),
            //         borderRadius: const BorderRadius.all(Radius.circular(8))),
            //     label: const Text('Ime'),
            //     contentPadding:
            //         const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            // TextFormField(
            //   onChanged: (value) => setState(() {
            //     lastName = value;
            //   }),
            //   initialValue: lastName,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: AppColors.textColor,
            //         ),
            //         borderRadius: const BorderRadius.all(Radius.circular(8))),
            //     label: const Text('Prezime'),
            //     contentPadding:
            //         const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
            //   ),
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
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
                obscureText: shouldObscureTextPassword,
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
                      shouldObscureTextPassword = !shouldObscureTextPassword;
                    });
                  },
                  icon: Icon(shouldObscureTextPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  color: AppColors.clientOrange,
                ),
              )
            ]),
            SizedBox(
              height: 6,
            ),
            Text(
              'Lozinka mora da sadrži najmanje 8 karaktera, jedno malo i veliko slovo i jedan broj.',
              style: TextStyle(fontSize: 10, color: AppColors.grayBlue),
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(children: [
              TextFormField(
                onChanged: (value) => setState(() {
                  passwordRepeated = value;
                }),
                initialValue: passwordRepeated,
                obscureText: shouldObscureTextRepeat,
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
                      shouldObscureTextRepeat = !shouldObscureTextRepeat;
                    });
                  },
                  icon: Icon(shouldObscureTextRepeat
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                  color: AppColors.clientOrange,
                ),
              )
            ]),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: submitEnabled
                    ? () {
                        widget.onSubmit(email, password);
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
                    'Potvrdi i nastavi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )),
          ]),
        ),
      ],
    );
  }
}
