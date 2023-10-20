enum AppRoutes {
  home,
  benefits,
  benefitDetail,
  aboutUs,
  donate,
  qrVerification,
  qrScanner,
  qrResult,
  myQR,
  authentification,
  checkEmail,
  userProfile
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
        AppRoutes.qrResult => '/qrResult',
        AppRoutes.myQR => '/myQr',
        AppRoutes.checkEmail => '/checkEmail',
        AppRoutes.userProfile => '/userProfile',
      };
}
