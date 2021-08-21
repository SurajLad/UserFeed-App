import 'dart:convert';

import 'package:freespace_test/api/api_client.dart';
import 'package:freespace_test/modules/home/model/feed.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<User>? feed = [];
  @override
  void onInit() async {
    await API().getUsers().then(
      (value) async {
        feed = value;
        update();
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
