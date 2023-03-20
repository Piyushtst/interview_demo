import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/app/moduls/profile/controller/edit_profile_controller.dart';
import 'package:news_demo/global/constants/sizeConstant.dart';
import 'package:news_demo/global/widgets/app_button.dart';
import 'package:news_demo/global/widgets/app_text.dart';
import 'package:news_demo/global/widgets/textfield.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);


  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  //static EditProfileController get to => Get.find();
  final EditProfileController controller = Get.put(EditProfileController());

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
 // final EditProfileController controller = EditProfileController();

  @override
  Widget build(BuildContext context) {
    MySize().init(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leadingWidth: MySize.size30,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: MySize.getScaledSizeWidth(24.00)),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.black, size: MySize.size20)),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: AppText(
            text: "Edit Profile",
            size: 14.0,
            txtColor: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(24.00)),
        child: SingleChildScrollView(
          child: Form(
            key: controller.editProfileKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.height(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MySize.size90,
                      width: MySize.size90,
                      decoration: profileImage != null
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: FileImage(profileImage!), fit: BoxFit.cover),
                            )
                          : const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/images/png/profilescreen.png"), fit: BoxFit.cover),
                            ),
                    ),
                    InkWell(
                      onTap: () async {
                        result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'doc'],
                        );
                        List<File> files = result!.paths.map((path) => File(path!)).toList();
                        profileImage = files[0];
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        //  width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: MySize.getScaledSizeWidth(12.00), vertical: MySize.getScaledSizeHeight(10.00)),
                          child: Row(
                            children: [
                              Image(
                                image: const AssetImage("assets/images/png/pen2.png"),
                                fit: BoxFit.fill,
                                height: MySize.size18,
                                width: MySize.size18,
                              ),
                              SizedBox(
                                width: MySize.size10,
                              ),
                              AppText(
                                text: "Update Image",
                                size: 14.0,
                                txtColor: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Space.height(24),
                AppText(
                  text: "Personal Details",
                  size: 16.0,
                  txtColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(16),
                AppText(
                  text: "First Name",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller:controller.firstNameController.value,
                  needValidation: true,
                  onlyAlphabetValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "First Name",
                  hintText: "First Name",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "Middle Name",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller:controller.middleNameController.value,
                  hintText: "Middle Name",
                  needValidation: true,
                  onlyAlphabetValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "Middle Name",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "Last Name",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller:controller.lastNameController.value,
                  hintText: "Last Name",
                  needValidation: true,
                  onlyAlphabetValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "Last Name",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "Mobile",
                  size: 12.0,
                  txtColor:Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller: controller.phoneNumberController.value,
                  maxLength: 10,
                  keyBoardTypeEnter: TextInputType.number,
                  showNumber: true,
                  needValidation: true,
                  isPhoneValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "Mobile",
                  hintText: "Mobile",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "Email",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller: controller.emailController.value,
                  hintText: "Email",
                  needValidation: true,
                  isEmailValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "Email",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(6),
                AppText(
                  text: "street",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller: controller.streetController.value,
                  hintText: "street",
                  needValidation: true,
                  onlyAlphabetValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "street",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),AppText(
                  text: "City",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller: controller.cityController.value,
                  hintText: "City",
                  needValidation: true,
                  onlyAlphabetValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "City",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "State Id",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller:controller.stateIdController.value,
                  hintText: "State Id",
                  maxLength: 10,
                  keyBoardTypeEnter: TextInputType.number,
                  showNumber: true,
                  //needValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "State Id",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                AppText(
                  text: "Country Id",
                  size: 12.0,
                  txtColor: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                Space.height(6),
                AppTextField(
                  controller:controller.countryIdController.value,
                  hintText: "Country Id",
                  maxLength: 10,
                  keyBoardTypeEnter: TextInputType.number,
                  showNumber: true,
                  needValidation: true,
                  //isPhoneValidation: true,
                  upperCaseTextFormatter: false,
                  validationMessage: "Country Id",
                  maxLines: 1,
                  tcPadding: 16,
                  bcPadding: 16,
                ),
                Space.height(16),
                Space.height(40),
                Obx(() => controller.isLoading.value?Center(child: const CupertinoActivityIndicator()):AppButton(
                  btnText: "Save",
                  bttxtColor: Colors.white,
                  bgColor: Colors.green,
                  onTap: (){
                    if (controller.editProfileKey.currentState!.validate()) {

                      controller.editApi();
                    }

                  },
                ),),


                Space.height(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
