import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/app/moduls/splace/controller/splash_controller.dart';
import 'package:news_demo/global/constants/sizeConstant.dart';


class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(
      context,
    );
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/png/splasbg2.png"), fit: BoxFit.fill),
                    ),
                    child: Center(
                        child: Image(
                      image:  const AssetImage("assets/images/png/profil.png"),
                      fit: BoxFit.contain,
                      height: MySize.size164,
                      width: MySize.size137,
                    )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
