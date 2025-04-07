import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'controller/LocalizationController.dart';
import 'core/bindings/mybindings.dart';
import 'core/constants/app_constants.dart';
import 'core/helper/route_helper.dart';
import 'core/locale/locale.dart';

import 'core/theme/light.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizeController) {

      return OverlayKit(
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(
                title: AppConstants.appName,
                theme: light(),
                initialBinding: Mybinding(),
                locale: localizeController.locale,
                translations: MyLocale(),
                navigatorKey: Get.key,
                initialRoute: RouteHelper.initial,
                fallbackLocale: Locale(AppConstants.languages[1].languageCode!,
                    AppConstants.languages[1].countryCode),
                debugShowCheckedModeBanner: false,
                getPages: RouteHelper.routes,
              );
            }),
      );
    });
  }
}
