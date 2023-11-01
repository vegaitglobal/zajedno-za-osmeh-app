import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/authentification_feature/components/auth_card.dart';

class UpdatePasswordCard extends StatefulWidget {
  const UpdatePasswordCard({super.key});

  @override
  State<UpdatePasswordCard> createState() => _UpdatePasswordCardState();
}

class _UpdatePasswordCardState extends State<UpdatePasswordCard> {
  Key formKey = GlobalKey();

  bool isPasswordValid = true;
  bool isRepeatedPasswordValid = true;
  bool isPasswordObscured = true;
  bool isRepeatedPasswordObscured = true;
  bool isButtonDisabled = true;
  String password = '';
  String repeatedPassword = '';

  bool validatePassword(String password) {
    final passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{7,}$',
      caseSensitive: false,
      multiLine: false,
    );
    return passwordRegExp.hasMatch(password);
  }

  bool validateRepeatedPassword(String repeatedPassword) {
    return password == repeatedPassword;
  }

  @override
  Widget build(BuildContext context) {
    isButtonDisabled =
        isPasswordValid && isRepeatedPasswordValid && password.isNotEmpty;

    return Column(
      children: [
        Text(
          'Resetovanje lozinke',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: formKey,
          child: AuthCard(
            children: [
              Stack(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        isPasswordValid = validatePassword(value);
                        password = value;
                      });
                    },
                    initialValue: password,
                    autocorrect: false,
                    obscureText: isPasswordObscured,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText:
                          !isPasswordValid ? "Lozinka nije ispravna" : null,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      label: const Text('Lozinka'),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordObscured = !isPasswordObscured;
                        });
                      },
                      icon: Icon(
                        isPasswordObscured
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      color: AppColors.clientOrange,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Stack(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        isRepeatedPasswordValid =
                            validateRepeatedPassword(value) &&
                                validatePassword(value);
                        repeatedPassword = value;
                      });
                    },
                    initialValue: repeatedPassword,
                    autocorrect: false,
                    obscureText: isRepeatedPasswordObscured,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: !isRepeatedPasswordValid
                          ? "Lozinke se ne poklapaju"
                          : null,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.textColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      label: const Text('Ponovi lozinku'),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 10),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isRepeatedPasswordObscured =
                              !isRepeatedPasswordObscured;
                        });
                      },
                      icon: Icon(
                        isRepeatedPasswordObscured
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      color: AppColors.clientOrange,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: isButtonDisabled
                    ? () {
                        // context
                        //     .read<AuthenticationBloc>()
                        //     .add(ResetPasswordEvent(email));
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(const SnackBar(
                        //   content: Text(
                        //       "Email za resetovanje lozinke vam je poslat."),
                        // ));
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
                    color: isButtonDisabled
                        ? AppColors.buttonEnabled
                        : AppColors.buttonDisabled,
                  ),
                  child: const Text(
                    'Promeni lozinku',
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
