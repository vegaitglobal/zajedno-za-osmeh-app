import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/authentication/bloc/authentication_bloc.dart';
import 'package:gu_mobile/ui/common/custom_appbar.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_bloc.dart';
import 'package:gu_mobile/ui/profile_page/bloc/donee_state.dart';
import 'package:gu_mobile/ui/profile_page/view/delete_account_dialog.dart';
import 'package:gu_mobile/ui/profile_page/view/profile_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void signOut() {
      context.go(AppRoutes.home.path());
      BlocProvider.of<AuthenticationBloc>(context).add(const SignOutEvent());
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: BlocListener<DoneeBloc, DoneeState>(
        listener: (BuildContext context, DoneeState state) {
          if (state is DoneeSuccessState) {
            signOut();
          } else if (state is DoneeFailureState) {
            print('fail:');
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ProfileButton(
                  onPress: () {},
                  icon: Icons.password_outlined,
                  text: "Promeni lozinku",
                ),
                const SizedBox(height: 20),
                ProfileButton(
                  onPress: signOut,
                  icon: Icons.logout,
                  text: "Odjavi se",
                ),
                const SizedBox(height: 20),
                ProfileButton(
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DeleteAccountDialog();
                      },
                    );
                  },
                  icon: Icons.delete,
                  text: "Izbriši nalog",
                  iconColor: Colors.red,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
