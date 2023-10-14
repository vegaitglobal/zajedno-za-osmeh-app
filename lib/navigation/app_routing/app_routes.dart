enum AppRoutes {
  home,
  benefits,
  benefitDetail,
  aboutUs,
}

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.home => '/',
        AppRoutes.benefits => '/benefits',
        AppRoutes.benefitDetail => '/benefitDetail',
        AppRoutes.aboutUs => '/aboutUs',
      };
}
