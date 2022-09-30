import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/job_post_card_vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class SuggestedJobsPage extends StatelessWidget {
  const SuggestedJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: (() => Get.back()),
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Suggested Jobs",
        action: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              GetX<JobPostsController>(
                init: Get.put<JobPostsController>(JobPostsController()),
                builder: (controller) {
                  return controller.initialized &&
                          controller.jobPosts.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.jobPosts.length,
                          itemBuilder: (context, index) {
                            return JobPostCardVt(
                              data: controller.jobPosts[index],
                            );
                          })
                      : const SizedBox(
                          height: 100,
                          width: 50,
                          child: Center(child: CircularProgressIndicator()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
