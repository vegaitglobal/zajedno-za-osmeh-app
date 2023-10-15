enum AppRoutes {
  home,
  authentification,
  benefits,
  benefitDetail,
  aboutUs,
  donate,
  qrVerification,
  qrScanner,
  qrResult,
}

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.home => '/home',
        AppRoutes.authentification => '/authentification',
        AppRoutes.benefits => '/benefits',
        AppRoutes.benefitDetail => '/benefitDetail',
        AppRoutes.aboutUs => '/aboutUs',
        AppRoutes.donate => '/donate',
        AppRoutes.qrVerification => '/qrVerification',
        AppRoutes.qrScanner => '/qrScanner',
        AppRoutes.qrResult => '/qrResult'
      };
}
