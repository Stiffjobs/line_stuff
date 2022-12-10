import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:line_stuff/common/index.dart';
import 'package:line_stuff/common/widgets/index.dart';

import 'global.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, _) => GetMaterialApp(
        getPages: RoutePages.list,
        initialRoute: RouteNames.splash,
        builder: EasyLoading.init(builder: ((context, child) {
          EasyLoading.instance
            ..displayDuration = const Duration(milliseconds: 2000)
            ..indicatorType = EasyLoadingIndicatorType.ring
            ..loadingStyle = EasyLoadingStyle.custom
            ..radius = 20.w
            ..boxShadow = [
              BoxShadow(
                color: Theme.of(context).colorScheme.shadow.withOpacity(0.15),
                offset: const Offset(0, 0),
                blurRadius: 20.w,
              ),
            ]
            ..progressColor = Colors.transparent
            ..contentPadding = EdgeInsets.all(20.w)
            ..backgroundColor = Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.surface
                : Theme.of(context).colorScheme.tertiary
            ..indicatorColor = Colors.transparent
            ..textColor = Theme.of(context).colorScheme.onSurface
            ..textStyle = TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17.w,
              color: Theme.of(context).colorScheme.onSurface,
            )
            ..maskType = EasyLoadingMaskType.clear
            ..maskColor = const Color(0xFF09101D).withOpacity(0.7)
            ..userInteractions = true
            ..indicatorWidget = CustomLoadingIndicator(
              size: 60.w,
              color: Colors.grey,
            )
            ..dismissOnTap = false;
          return ScrollConfiguration(behavior: NoShadowScrollBehavior(), child: child ?? const Material());
        })),
      ),
    );
  }
}

class NoShadowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return child;
      case TargetPlatform.android:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).colorScheme.primary,
          child: child,
        );
    }
  }
}
