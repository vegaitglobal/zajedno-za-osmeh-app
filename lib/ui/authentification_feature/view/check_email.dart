import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gu_mobile/navigation/app_routing/app_routes.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Registracija'),
        Container(
          child: Column(
            children: [
              const Text(
                  'Primili smo Vaš zahtev za registraciju, naš admin tim će pregledati Vašu prijavu i dobićete potvrdu na unetu email adresu da li je Vaš zahtev prihvaćen. \n Ukoliko Vaša prijava bude prihvaćena, na aplikaciji ć Vam biti dostupan QR kod koji możete prikazati prilikom korišćenja povlašćenih usluga.'),
              TextButton(
                child: const Text('Završi i idi na početnu stranu'),
                onPressed: () {
                  context.go(AppRoutes.home.path());
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
