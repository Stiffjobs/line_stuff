part of services;

class ApiService extends GetxService {
  static ApiService get to => Get.find();

  late final Dio dio;

  @override
  void onInit() {
    super.onInit();
    BaseOptions baseOptions = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {},
      responseType: ResponseType.json,
    );

    dio = Dio(baseOptions);
  }
}
