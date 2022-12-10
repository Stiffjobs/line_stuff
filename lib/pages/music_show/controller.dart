part of music_show_page;

class MusicShowController extends GetxController {
  static MusicShowController go = Get.find();
  List<ShowModel> musicShowList = [];
  final api = ApiService.to.dio;
  String appbarTitle = '音樂表演';

  Future<void> init() async {
    try {
      CustomToast.loading();

      final response =
          await api.get('https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=1');
      if (response.statusCode == 200) {
        StorageService.to.setString(Constants.storageMusicShow, jsonEncode(response.data));
        musicShowList = (response.data as List).map((e) => ShowModel.fromJson(e)).toList();
        update();
      }
    } catch (e) {
      Console.error(e.toString());
    }
  }

  @override
  void onReady() async {
    super.onReady();
    await init();
    CustomToast.dismiss();
  }
}
