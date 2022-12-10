part of main_page;

class MainController extends GetxController {
  static MainController go = Get.find();
  List<MusicShowModel> musicShowList = [];
  final api = ApiService.to.dio;
  String appbarTitle = '音樂表演';

  Future<void> init() async {
    CustomToast.loading();

    final response =
        await api.get('https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=1');
    if (response.statusCode == 200) {
      musicShowList = (response.data as List).map((e) => MusicShowModel.fromJson(e)).toList();
      update();
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await init();
    CustomToast.dismiss();
  }
}
