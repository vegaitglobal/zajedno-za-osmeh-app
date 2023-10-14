enum AppRoutes {
  home,
  benefits,
  benefitDetail,
  aboutUs,
  donate
}

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.home => '/',
        AppRoutes.benefits => '/benefits',
        AppRoutes.benefitDetail => '/benefitDetail',
        AppRoutes.aboutUs => '/aboutUs',
        AppRoutes.donate => '/donate',
      };
}
