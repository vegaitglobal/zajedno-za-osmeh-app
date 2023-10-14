enum AppRoutes { home, benefits, benefitDetail, aboutUs, donate }

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.home => '/home',
        AppRoutes.benefits => '/benefits',
        AppRoutes.benefitDetail => '/home/benefitDetail',
        AppRoutes.aboutUs => '/home/aboutUs',
        AppRoutes.donate => '/donate',
      };
}
