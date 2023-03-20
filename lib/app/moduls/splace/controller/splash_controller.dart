import 'package:get/get.dart';
import 'package:news_demo/app/moduls/auth/screens/login_screens.dart';


class SplashController extends GetxController {

  static SplashController get to => Get.find();

  void onInit() async {
    super.onInit();
print("++++++++++++++++++++++++++++");
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(const LoginScreen());
      });

    }
  }


