import 'package:flutter/material.dart';
import 'package:freespace_test/modules/home/controller/home_controller.dart';
import 'package:freespace_test/utils/app_constants/app_colors.dart';
import 'package:freespace_test/utils/app_constants/app_routes.dart';
import 'package:freespace_test/utils/app_constants/app_text_styles.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Users",
          style: AppTextStyles.appBarTextStyle,
        ),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.feed == null
            ? Container()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Get.toNamed(
                        AppRoute.POSTS,
                        arguments: {
                          "userId": controller.feed?[index].id,
                          "userName": controller.feed?[index].name,
                        },
                      );
                    },
                    leading: Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    title: Text(
                      controller.feed?[index].name ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
                itemCount: controller.feed?.length,
              );
      }),
    );
  }
}
