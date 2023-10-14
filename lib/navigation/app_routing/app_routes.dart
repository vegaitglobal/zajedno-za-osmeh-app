enum AppRoutes { home, benefits, benefitDetail, aboutUs, donate, qrVerification }

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.home => '/home',
        AppRoutes.benefits => '/benefits',
        AppRoutes.benefitDetail => '/benefitDetail',
        AppRoutes.aboutUs => '/aboutUs',
        AppRoutes.donate => '/donate',
        AppRoutes.qrVerification => '/qrVerification',
      };
}
