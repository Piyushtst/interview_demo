import 'package:get/get.dart';
import 'package:news_demo/app/moduls/splace/binding/splash_binding.dart';

import '../moduls/splace/screens/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;


  static final routes = [

    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

  ];
}
