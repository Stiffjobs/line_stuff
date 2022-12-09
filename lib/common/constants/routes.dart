part of constants;

class RouteNames {
  static const main = '/main';
}

class RoutePages {
  static final List<GetPage> list = [
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
    )
  ];
}
