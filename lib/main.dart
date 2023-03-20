import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_demo/app/routes/app_pages.dart';


void main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
