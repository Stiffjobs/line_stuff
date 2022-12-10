part of splash_page;

class SplashController extends GetxController {
  SplashController();

  void jumpToPage() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(RouteNames.main);
  }

  @override
  void onReady() {
    super.onReady();

    jumpToPage();
  }
}
