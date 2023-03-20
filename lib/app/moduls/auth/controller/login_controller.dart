import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_demo/app/moduls/profile/screens/edit_profile.dart';


class LoginController extends GetxController{

  static LoginController get to => Get.find();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isVisible = false.obs;
  RxBool isLoading = false.obs;
  Rx<TextEditingController> idController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  Future<void> signInApi() async {
    isLoading.value=true;
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('https://loan-api.banastech.com/api/1.0/user/login'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "db": "Lending",
        "login": idController.value.text,
        "password": passwordController.value.text,
        "app_user_type": "agent"
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {

      var data=jsonDecode(response.body);

      if(data["result"]["status"]==200){
        Get.to(const EditProfile());
      }
      else if(data["result"]["status"]==400){
        Get.snackbar("Login", "Wrong login/password");
      }


      isLoading.value=false;
    }
    else {
      print(response.reasonPhrase);
      isLoading.value=false;
    }

  }
}