import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/resources/my_colors.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';
import 'package:gu_mobile/ui/authentification_feature/components/auth_card.dart';
import 'package:gu_mobile/ui/common/custom_bottom_navigation_bar.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Registracija',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AuthCard(children: [
              Text(
                'Primili smo Vaš zahtev za registraciju, naš admin tim će pregledati Vašu prijavu i dobićete potvrdu na unetu email adresu da li je Vaš zahtev prihvaćen. \n\n Ukoliko Vaša prijava bude prihvaćena, na aplikaciji ć Vam biti dostupan QR kod koji możete prikazati prilikom korišćenja povlašćenih usluga.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                  onTap: () {
                    context.go(AppRoutes.home.path());
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: AppColors.buttonEnabled,
                    ),
                    child: const Text(
                      'Završi i idi na početnu stranu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
