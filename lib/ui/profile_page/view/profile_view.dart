import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/ui/common/custom_appbar.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Petar Petrovic", //TODO: Use users real name and surname
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('go to edit screen');
                        },
                        child: const Image(
                          image: AssetImage(
                              'assets/images/icons/edit_profile.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print('Sign out');
              },
              child: const Text('Sign out'),
            ),
            TextButton(
              onPressed: () {
                print('delete account');
              },
              child: const Text('Delete account'),
            )
          ],
        ),
      ),
    );
  }
}
