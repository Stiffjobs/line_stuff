part of constants;

class RouteNames {
  static const main = '/main';
  static const splash = '/splash';
  static const musicShow = '/music_show';
  static const showDetail = '/show_detail';
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
    ),
    GetPage(
      name: RouteNames.musicShow,
      page: () => MusicShowPage(),
    ),
    GetPage(
      name: RouteNames.showDetail,
      transition: Transition.cupertino,
      page: () => ShowDetailPage(),
    ),
  ];
}
