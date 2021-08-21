import 'package:flutter/material.dart';
import 'package:freespace_test/modules/Posts/controller/user_post_controller.dart';
import 'package:freespace_test/utils/app_constants/app_colors.dart';
import 'package:freespace_test/utils/app_constants/app_text_styles.dart';
import 'package:freespace_test/utils/ui/loader.dart';
import 'package:get/get.dart';

class CreatePostPage extends StatelessWidget {
  final UserPostsController userPostsController =
      Get.find<UserPostsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.black),
        title: Text(
          "Create post",
          style: AppTextStyles.appBarTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Post Title",
              style: AppTextStyles.regularBoldTextStyle,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: userPostsController.titleController,
              maxLength: 100,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Post Description",
              style: AppTextStyles.regularBoldTextStyle,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: userPostsController.descriptionController,
              maxLines: 4,
              maxLength: 300,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                ),
                onPressed: () {
                  Get.dialog(
                    Loader(),
                  );
                  userPostsController.addUserPosts().then(
                    (value) {
                      Get.back(); // Pop Loader
                      if (value) {
                        Get.snackbar(
                          "Sucess",
                          "Your POst Has been Added.",
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.GROUNDED,
                        );
                      } else {
                        Get.snackbar(
                          "Failed",
                          "(400) Something went wrong, Please try again.",
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.GROUNDED,
                        );
                      }
                    },
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.black,
                  size: 20,
                ),
                label: Text(
                  "Add Post",
                  style: AppTextStyles.regularTextStyle,
                ),
              ),
            )
          ],
        ).paddingOnly(left: 15, right: 15),
      ),
    );
  }
}
