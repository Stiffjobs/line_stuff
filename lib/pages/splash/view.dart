part of splash_page;

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              color: ColorTheme.lineGreenColor,
              child: Center(
                child: Text(
                  'Music Info',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 50.w,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
