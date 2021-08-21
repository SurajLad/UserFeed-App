import 'package:freespace_test/api/api_client.dart';
import 'package:freespace_test/modules/home/model/feed.dart';
import 'package:get/get.dart';

class UserPostsController extends GetxController {
  List<Posts>? userPosts = [];
  String? userId;
  RxString? userName = "".obs;

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

  @override
  void onClose() {
    super.onClose();
  }
}
