import 'package:get/get.dart';

import 'masjids_controller.dart';

class MasjidsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasjidsController>(
        () => MasjidsController());
  }
}
