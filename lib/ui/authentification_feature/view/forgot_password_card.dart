import 'package:flutter/material.dart';

import '../../../resources/my_colors.dart';

class ForgotPasswordCard extends StatelessWidget {
  const ForgotPasswordCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Zaboravljena lozinka',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor),
        ),
      ],
    );
  }
}
