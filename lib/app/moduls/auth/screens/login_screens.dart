import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/app/moduls/auth/controller/login_controller.dart';
import 'package:news_demo/app/moduls/profile/screens/edit_profile.dart';
import 'package:news_demo/global/constants/sizeConstant.dart';
import 'package:news_demo/global/widgets/app_text.dart';
import 'package:news_demo/global/widgets/textfield.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(
      context,
    );
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(27.00)),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Space.height(45),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppRitchText(text: "Welcome to", text2: " LOREM"),
                          InkWell(
                            onTap: () {
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "No Account ?", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(13.00), txtColor: Colors.grey),
                                Space.height(6),
                                AppText(text: "Sign up", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(13.00), txtColor: Colors.green),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Space.height(20),
                      AppText(text: "Sign in", fontWeight: FontWeight.w500, size: MySize.getScaledSizeHeight(40.00), txtColor: Colors.black),
                      Space.height(50),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              height: MySize.size65,
                              // width: MySize.size180,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(12.00)),
                                    child: FittedBox(child: Image(image: const AssetImage("assets/images/png/google.png"), height: MySize.getScaledSizeHeight(24.00), width: MySize.getScaledSizeWidth(22.00))),
                                  ),
                                  FittedBox(child: AppText(text: "Sign in with Google", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.blue)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.getScaledSizeWidth(12.00)),
                              height: MySize.size65,
                              //width: MySize.size50,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child:
                                  FittedBox(child: Image(image: const AssetImage("assets/images/png/facebook.png"), height: MySize.getScaledSizeHeight(19.00), width: MySize.getScaledSizeWidth(19.00)))),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: MySize.getScaledSizeWidth(12.00)),
                              height: MySize.size65,
                              //width: MySize.size50,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: FittedBox(child: Image(image: const AssetImage("assets/images/png/apple.png"), height: MySize.getScaledSizeHeight(19.00), width: MySize.getScaledSizeWidth(19.00)))),
                            ),
                          ),
                        ],
                      ),
                      Space.height(60),
                      AppText(text: "Enter your username or email address", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
                      Space.height(22),
                      AppTextField(
                        hintText: "Username or email address",
                        controller: controller.idController.value,
                        needValidation: true,
                        isEmailValidation: true,
                        upperCaseTextFormatter: false,
                        validationMessage: "Email",
                        tcPadding: 24,
                        bcPadding: 24,
                      ),
                      Space.height(40),
                      AppText(text: "Enter your Password", fontWeight: FontWeight.w400, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.black),
                      Space.height(22),
                      Obx(() => AppTextField(
                        hintText: "Password",
                        controller: controller.passwordController.value,
                        needValidation: true,
                        isPassWordValidation: true,
                        obscureText: controller.isVisible.value,
                        validationMessage: "Password",
                        maxLines: 1,
                        iconButton: InkWell(
                            onTap: () {
                              controller.isVisible.value = !controller.isVisible.value;
                              //setState(() {});
                            },
                            child: Icon(
                              controller.isVisible.value ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            )),
                        tcPadding: 24,
                        bcPadding: 24,
                      ),),
                      Space.height(14),
                      Align(alignment: Alignment.bottomRight, child: AppText(text: "Forgot Password   ", fontWeight: FontWeight.w400, size: MySize.size14, txtColor: Colors.blue)),
                      Space.height(54),
                      Obx(() => Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.signInApi();
                              print("okay");
                            }
                            //Get.to(EditProfile());
                          },
                          child: Container(
                            height: MySize.getScaledSizeHeight(58.00),
                            width: MySize.getScaledSizeWidth(149.00),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child:controller.isLoading.value?const CupertinoActivityIndicator(): FittedBox(child: AppText(text: "Sign in", fontWeight: FontWeight.w500, size: MySize.getScaledSizeHeight(16.00), txtColor: Colors.white))),
                          ),
                        ),
                      ),),
                      Space.height(79),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}