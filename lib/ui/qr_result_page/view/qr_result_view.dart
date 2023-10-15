import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/app_routing/app_routes.dart';
import '../../../resources/my_colors.dart';
import '../../common/custom_bottom_navigation_bar.dart';

class QRResultView extends StatelessWidget {
  final bool isValid;
  const QRResultView({super.key, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 150,
        leading: GestureDetector(
          onTap: () => context.go(AppRoutes.home.path()),
          child: Container(
            margin: const EdgeInsets.only(left: 16),
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
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Verifikacija korisnika',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.royalBlue,
              ),
            ),
            Image(image: AssetImage('assets/images/icons/${isValid ? 'valid' : 'invalid'}_qr_icon.png')),
            SizedBox(
              width: 295,
              child: OutlinedButton(
                onPressed: () => context.go(AppRoutes.qrScanner.path()),
                style: ButtonStyle(side: MaterialStateProperty.resolveWith((states) => BorderSide(color: AppColors.royalBlue))),
                child: Text(
                  "Vrati se na skener",
                  style: TextStyle(color: AppColors.royalBlue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
