import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/services/index.dart';

class Global {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Future.wait(
      [Get.putAsync(() => StorageService().init())],
    ).whenComplete(() {
      Get.put<ApiService>(ApiService());
    });
  }
}
