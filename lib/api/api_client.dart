import 'package:freespace_test/modules/home/model/feed.dart';
import 'package:freespace_test/utils/app_constants/app_constants.dart';
import 'package:get/get.dart';

class API extends GetConnect {
  Future<List<User>?> getUsers() async {
    List<User>? feed;

    await get(AppConstants().baseUrl + "/users").then(
      (response) {
        var parsed = response.body as List;
        feed = parsed.map((e) => User.fromJson(e)).toList();
      },
    );
    return feed;
  }

  getUserPosts({String? userId}) async {
    List<Posts>? feed;

    await get(AppConstants().baseUrl + "/users/$userId/posts").then(
      (response) {
        print(response.body);
        var parsed = response.body as List;
        feed = parsed.map((e) => Posts.fromJson(e)).toList();
      },
    );
    return feed;
  }
}
