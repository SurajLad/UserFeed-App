import 'package:flutter/material.dart';
import 'package:freespace_test/modules/Posts/controller/user_post_controller.dart';
import 'package:freespace_test/utils/app_constants/app_colors.dart';
import 'package:freespace_test/utils/app_constants/app_text_styles.dart';
import 'package:get/get.dart';

class UserPostsHome extends StatelessWidget {
  final UserPostsController userPostsController =
      Get.put(UserPostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
        title: Obx(
          () {
            return Text(
              userPostsController.userName!.value + " Posts",
              style: AppTextStyles.regularTextStyle,
            );
          },
        ),
      ),
      body: GetBuilder<UserPostsController>(builder: (controller) {
        return controller.userPosts == null
            ? Container()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 15, right: 10, top: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, .5),
                          blurRadius: 1.0,
                        )
                      ],
                    ),
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        controller.userPosts?[index].title ?? "",
                        style: TextStyle(fontSize: 24),
                      ).paddingOnly(bottom: 10),
                      subtitle: Text(
                        controller.userPosts?[index].body ?? "",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
                itemCount: controller.userPosts?.length,
              );
      }),
    );
  }
}
