import 'package:freespace_test/modules/Posts/view/create_post.dart';
import 'package:freespace_test/modules/Posts/view/home.dart';
import 'package:freespace_test/modules/home/view/home.dart';
import 'package:freespace_test/modules/splash/view/splash.dart';
import 'package:freespace_test/utils/app_constants/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoute.SPLASH,
      page: () => Splash(),
    ),
    GetPage(
      name: AppRoute.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: AppRoute.POSTS,
      page: () => UserPostsHome(),
    ),
    GetPage(
      name: AppRoute.ADDPOSTS,
      page: () => CreatePostPage(),
    ),
  ];
}
