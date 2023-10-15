import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/app_routing/app_routes.dart';
import '../../../resources/my_colors.dart';
import '../../common/custom_bottom_navigation_bar.dart';
import '../bloc/qr_verification_bloc.dart';
import '../bloc/qr_verification_event.dart';

class QRVerificationView extends StatelessWidget {
  const QRVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Skeninraj QR kod',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.royalBlue,
              ),
            ),
            const Image(image: AssetImage('assets/images/icons/qr_code_icon.png')),
            SizedBox(
              width: 295,
              child: OutlinedButton(
                onPressed: () => context.go(AppRoutes.qrScanner.path()),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => AppColors.primaryGreen),
                    side: MaterialStateProperty.resolveWith((states) => BorderSide(color: AppColors.royalBlue))),
                child: const Text(
                  "Skeniraj QR kod",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
