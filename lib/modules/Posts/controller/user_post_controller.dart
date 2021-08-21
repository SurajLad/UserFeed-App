import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:freespace_test/api/api_client.dart';
import 'package:freespace_test/modules/home/model/feed.dart';
import 'package:get/get.dart';

class UserPostsController extends GetxController {
  List<Posts>? userPosts = [];
  String? userId;
  RxString? userName = "".obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    userId = Get.arguments["userId"];
    userName?.value = Get.arguments["userName"];

    await API().getUserPosts(userId: userId).then(
      (value) async {
        userPosts = value;
        update();
      },
    );
    super.onInit();
  }

  Future addUserPosts() async {
    isLoading.value = true;
    var body = {
      "title": titleController.text,
      "body": descriptionController.text
    };
    bool isSucess =
        await API().postUserPosts(userId: userId, body: json.encode(body));
    return isSucess;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
