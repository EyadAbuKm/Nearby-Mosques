import 'package:masjidi/modules/modules.dart';
import 'package:get/get.dart';
import 'package:masjidi/modules/masjids/controller/masjids_binding.dart';
import 'package:masjidi/modules/masjids/view/masjids_screen.dart';


import '../../modules/home/home.dart';
import '../../modules/masjids_map/view/masjids_map.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
      ),

    GetPage(
      name: Routes.MASJIDS_MAP,
      page: () => MasjidsMap(),
      binding: MasjidsBinding(),
    ),
    GetPage(
      name: Routes.MASJIDS,
      page: () => MasjidsScreen(),
      binding: MasjidsBinding(),
    ),


  ];
}
