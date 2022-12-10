part of main_page;

class MainController extends GetxController {
  static MainController go = Get.find();
  List<MusicShowModel> musicShowList = [];
  final api = ApiService.to.dio;

  Future<void> init() async {
    CustomToast.loading();

    await Future.delayed(Duration(seconds: 1));

    // final response = await api
    //     .get('https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=1');
  }

  @override
  void onReady() async {
    super.onReady();
    await init();
    CustomToast.dismiss();
  }
}
