import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/authentication/bloc/authentication_bloc.dart';
import 'package:gu_mobile/ui/authentification_feature/view/forgot_password_card.dart';
import 'package:gu_mobile/ui/authentification_feature/view/update_password_card.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

import '../../authentification_feature/view/login_card.dart';
import '../../authentification_feature/view/upload_medical_record.dart';

class AuthentificationView extends StatefulWidget {
  const AuthentificationView({super.key});

  @override
  State<AuthentificationView> createState() => _AuthentificationViewState();
}

class _AuthentificationViewState extends State<AuthentificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            buildWhen: (context, state) => _triggerBuilderOnStateChange(state),
            listenWhen: (context, state) =>
                _triggerListenerOnStateChange(state),
            listener: (context, state) => _handleEventListener(state, context),
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    height: 50,
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        if (state is AuthLoginState) {
                          context.go(AppRoutes.home.path());
                        }
                        context
                            .read<AuthenticationBloc>()
                            .add(const BackButtonPressedEvent());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/arrow_left.svg'),
                            const SizedBox(width: 8),
                            Text(
                              'Nazad',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.royalBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      switch (state) {
                        AuthLoginState() => LoginCard(
                            onSubmit: (email, password) =>
                                _loginAction(context, email, password),
                            navigateToSignUp: () => _switchToSignUp(context),
                            navigateToForgotPassword: () =>
                                _switchToForgotPassScreen(context),
                          ),
                        AuthFinalRegistrationState() => UploadMedicalrecordCard(
                            onSubmit: (filePath) =>
                                _registrationCompleteAction(context, filePath),
                          ),
                        UserLoggedOutState() => LoginCard(
                            onSubmit: (email, password) =>
                                _loginAction(context, email, password),
                            navigateToSignUp: () => _switchToSignUp(context),
                            navigateToForgotPassword: () =>
                                _switchToForgotPassScreen(context),
                          ),
                        ForgotenPasswordState() => const ForgotPasswordCard(),
                        UpdatePasswordState() => const UpdatePasswordCard(),
                        AuthErrorState() => Container(),
                        AuthInitialState() => Container(),
                        AuthRegistrationState() => Container(),
                        UserLoggedInState() => Container(),
                        RegistrationCompleteState() => Container(),
                        LoadingState() => const CircularProgressIndicator(),
                      }
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  _loginAction(BuildContext context, String email, String password) {
    context.read<AuthenticationBloc>().add(SignInEvent(email, password));
  }

  _registrationCompleteAction(BuildContext context, String filePath) {
    context.read<AuthenticationBloc>().add(CompleteSignUpEvent(filePath));
  }

  _switchToSignUp(BuildContext context) {
    context.read<AuthenticationBloc>().add(const SwitchToSignUpScreen());
  }

  _switchToForgotPassScreen(BuildContext context) {
    context.read<AuthenticationBloc>().add(const SwitchToForgotPassScreen());
  }

  bool _triggerBuilderOnStateChange(AuthenticationState state) {
    if (state is AuthLoginState ||
        state is AuthFinalRegistrationState ||
        state is UserLoggedOutState ||
        state is ForgotenPasswordState ||
        state is UpdatePasswordState) {
      return true;
    } else {
      return false;
    }
  }

  bool _triggerListenerOnStateChange(AuthenticationState state) {
    if (state is RegistrationCompleteState ||
        state is UserLoggedInState ||
        state is AuthRegistrationState ||
        state is AuthErrorState) {
      return true;
    } else {
      return false;
    }
  }

  void _navHomeOnStateChange(AuthenticationState state, BuildContext context) {
    if (state is RegistrationCompleteState || state is UserLoggedInState) {
      context.go(AppRoutes.home.path());
    }
  }

  void _navToSignupOnStateChange(
      AuthenticationState state, BuildContext context) {
    if (state is AuthRegistrationState) {
      context.go(AppRoutes.register.path());
    }
  }

  void _displayErrorMessageOnStateChange(
    AuthenticationState state,
    BuildContext context,
  ) {
    if (state is AuthErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Došlo je do greške prilikom prijave!"),
      ));
    }
  }

  void _handleEventListener(AuthenticationState state, BuildContext context) {
    _navHomeOnStateChange(state, context);
    _navToSignupOnStateChange(state, context);
    _displayErrorMessageOnStateChange(state, context);
  }
}
