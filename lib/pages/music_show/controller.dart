part of music_show_page;

class MusicShowController extends GetxController {
  static MusicShowController go = Get.find();
  List<ShowModel> musicShowList = [];
  final api = ApiService.to.dio;
  String appbarTitle = '音樂表演';
  FilterType filterType = FilterType.all;

  void handleSelect(FilterType type) {
    filterType = type;
    handleFilter(type);
    update();
  }

  void handleFilter(FilterType type) {
    switch (type) {
      case FilterType.all:
        final json = jsonDecode(StorageService.to.getString(Constants.storageMusicShow));
        musicShowList = (json as List).map((e) => ShowModel.fromJson(e)).toList();
        update(['list']);
        break;
      case FilterType.newest:
        musicShowList.sort((a, b) => b.startDate.compareTo(a.startDate));
        break;

      case FilterType.oldest:
        musicShowList.sort((a, b) => a.startDate.compareTo(b.startDate));
        break;
      case FilterType.popular:
        musicShowList.sort((a, b) => b.hitRate.compareTo(a.hitRate));
        break;
    }

    update(['list']);
  }

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
