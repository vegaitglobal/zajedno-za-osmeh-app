import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/resources/my_colors.dart';

class LeftArrowBackButton extends StatelessWidget {
  const LeftArrowBackButton({super.key, this.onPress});

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ?? () => context.go(AppRoutes.home.path()),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/arrow_left.svg',
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
      ),
    );
  }
}
