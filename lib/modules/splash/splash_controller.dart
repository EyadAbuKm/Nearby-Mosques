import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));

        Get.toNamed(Routes.HOME);

  }
}
