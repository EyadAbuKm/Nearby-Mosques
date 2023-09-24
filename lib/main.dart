import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_binding.dart';
import 'core/lang/translation_service.dart';
import 'core/managers/di_manager.dart';
import 'core/routes/app_pages.dart';
import 'shared/theme/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();

  runApp(App());
  configLoading();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
      builder: (_ , child) {
        return GetMaterialApp(
          title: "Masijdi",
          enableLog: true,
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          builder: EasyLoading.init(),
        );
      }
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
