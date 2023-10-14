import 'package:flutter/material.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class LeftArrowBackButton extends StatelessWidget {
  const LeftArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/icons/left_arrow.png',
          height: 14,
          width: 7,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          'Nazad',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor,
          ),
        )
      ],
    );
  }
}
