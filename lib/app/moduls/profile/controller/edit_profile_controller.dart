import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;




class EditProfileController extends GetxController{

  static EditProfileController get to => Get.find();

  GlobalKey<FormState> editProfileKey = GlobalKey<FormState>();
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> middleNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> streetController = TextEditingController().obs;
  Rx<TextEditingController> stateIdController = TextEditingController().obs;
  Rx<TextEditingController> countryIdController = TextEditingController().obs;

  RxBool isLoading = false.obs;


  FilePickerResult? result;
  File? uploadedDoc;
  File? profileImage;
  String dropdownvalue = 'dropdownvalue';

  List<String> items = [
    'Document 1',
    'Document 3',
    'Document 3',
    'Document 4',
    'Document 5',
  ];


  Future<void> editApi() async {
    isLoading.value=true;
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=d2167e64a4899794c8965ac205156d89c29dbf14'
    };
    var request = http.Request('POST', Uri.parse('https://loan-api.banastech.com/api/1.0/user/profile/edit'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {
        "db": "Lending",
        "first_name": firstNameController.value.text,
        "middle_name": middleNameController.value.text,
        "last_name": lastNameController.value.text,
        "mobile": phoneNumberController.value.text,
        "email": emailController.value.text,
        "street": streetController.value.text,
        "city": cityController.value.text,
        "state_id":stateIdController.value.text,
        "country_id":countryIdController.value.text,
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {

      var data=jsonDecode(response.body);

      print(data);

      if(data["result"]["status"]==200){
        Get.snackbar("Success", "User Profile Successfully Updated");
        firstNameController.value.clear();
        middleNameController.value.clear();
        lastNameController.value.clear();
        phoneNumberController.value.clear();
        emailController.value.clear();
        streetController.value.clear();
        cityController.value.clear();
        stateIdController.value.clear();
        countryIdController.value.clear();
      }
      else {
        Get.snackbar("Error", "Something want Wrong");
      }
      isLoading.value=false;
    }
    else {
      print(response.reasonPhrase);
      isLoading.value=false;
    }

  }

}