part of widgets;

class CustomToast {
  static void loading() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..userInteractions = false;
    EasyLoading.show();
  }

  static void dismiss() => EasyLoading.dismiss();
}
