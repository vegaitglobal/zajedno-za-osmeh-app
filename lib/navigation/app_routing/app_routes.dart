enum AppRoutes {
  example,
  coinsList,
}

extension AppRoutesExtension on AppRoutes {
  String path() => switch (this) {
        AppRoutes.example => '/',
        AppRoutes.coinsList => '/coins'
      };
}
