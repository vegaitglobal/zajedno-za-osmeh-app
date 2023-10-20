import 'package:flutter/material.dart';
import 'package:gu_mobile/ui/common/custom_appbar.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Column(
        children: [
          Text('User profile'),
          Text('Sign out button'),
          Text('Delete account button')
        ],
      ),
    );
  }
}
