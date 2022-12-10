import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/services/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<ApiService>(ApiService());
  }
}
