import 'package:get/get.dart';
import 'package:news_demo/app/moduls/splace/controller/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
  }
}
