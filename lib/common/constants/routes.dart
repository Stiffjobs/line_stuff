part of constants;

class RouteNames {
  static const main = '/main';
  static const splash = '/splash';
}

class RoutePages {
  static final List<GetPage> list = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
    )
  ];
}
