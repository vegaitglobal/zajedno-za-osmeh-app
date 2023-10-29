import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/authentication/bloc/authentication_bloc.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

import '../../authentification_feature/view/login_card.dart';
import '../../authentification_feature/view/upload_medical_record.dart';

class AuthentificationView extends StatefulWidget {
  AuthentificationView({super.key});

  @override
  State<AuthentificationView> createState() => _AuthentificationViewState();
}

class _AuthentificationViewState extends State<AuthentificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 150,
          leading: GestureDetector(
            onTap: () {
              context.read<AuthenticationBloc>().add(BackButtonPressedEvent());
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
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        body: Center(
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
            if (state is RegistrationCompleteState ||
                state is UserLoggedInState) {
              context.go(AppRoutes.home.path());
            }

            if (state is AuthRegistrationState) {
              context.go(AppRoutes.register.path());
            }
          }, builder: (context, state) {
            return switch (state) {
              AuthLoginState() => LoginCard(
                  onSubmit: (email, password) =>
                      _loginAction(context, email, password),
                  navigateToSignUp: () => _switchToSignUp(context),
                ),
              AuthFinalRegistrationState() => UploadMedicalrecordCard(
                  onSubmit: (filePath) =>
                      _registrationCompleteAction(context, filePath),
                ),
              AuthErrorState() =>
                Text("Došlo je do greške, proverite internet konekciju"),
              UserLoggedOutState() => LoginCard(
                  onSubmit: (email, password) =>
                      _loginAction(context, email, password),
                  navigateToSignUp: () => _switchToSignUp(context),
                ),
              AuthInitialState() => Container(),
              AuthRegistrationState() => Container(),
              UserLoggedInState() => Container(),
              RegistrationCompleteState() => Container(),
            };
          }),
        ));
  }

  _loginAction(BuildContext context, String email, String password) {
    context.read<AuthenticationBloc>().add(SignInEvent(email, password));
  }

  _signUpAction(BuildContext context, String email, String password) {
    context
        .read<AuthenticationBloc>()
        .add(EnterUserInformationEvent(email, password));
  }

  _registrationCompleteAction(BuildContext context, String filePath) {
    context.read<AuthenticationBloc>().add(CompleteSignUpEvent(filePath));
  }

  _switchToSignUp(BuildContext context) {
    context.read<AuthenticationBloc>().add(SwitchToSignUpScreen());
  }
}
