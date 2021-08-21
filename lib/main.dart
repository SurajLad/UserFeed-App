import 'package:flutter/material.dart';
import 'package:freespace_test/modules/splash/view/splash.dart';
import 'package:freespace_test/utils/app_constants/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      home: Splash(),
    );
  }
}
