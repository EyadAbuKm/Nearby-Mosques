import 'package:get/get.dart';

import '../../../core/managers/location_manager.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController());

    Get.put( LocationController(),permanent: true);

  }
}
