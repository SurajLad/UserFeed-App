import 'package:flutter/material.dart';
import 'package:freespace_test/modules/Posts/controller/user_post_controller.dart';
import 'package:freespace_test/utils/app_constants/app_colors.dart';
import 'package:freespace_test/utils/app_constants/app_routes.dart';
import 'package:freespace_test/utils/app_constants/app_text_styles.dart';
import 'package:get/get.dart';

class UserPostsHome extends StatelessWidget {
  final UserPostsController userPostsController =
      Get.put(UserPostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.backgroundColor,
        title: Obx(
          () {
            return Text(
              userPostsController.userName!.value.toString() + "'s Posts",
              style: AppTextStyles.appBarTextStyle,
            );
          },
        ),
      ),
      body: GetBuilder<UserPostsController>(
        builder: (controller) {
          return controller.userPosts == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 10, top: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, .25),
                            blurRadius: .4,
                          )
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          controller.userPosts?[index].title ?? "",
                          style: AppTextStyles.appBarTextStyle,
                        ).paddingOnly(bottom: 10),
                        subtitle: Text(
                          controller.userPosts?[index].body ?? "",
                          style: AppTextStyles.regularTextStyle,
                        ),
                      ),
                    );
                  },
                  itemCount: controller.userPosts?.length,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.ADDPOSTS);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
