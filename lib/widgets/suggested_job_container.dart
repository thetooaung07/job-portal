import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/job_post_card_vt.dart';
import 'package:job_portal/widgets/show_all_text_banner.dart';

class SuggestedJobContainer extends StatelessWidget {
  const SuggestedJobContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllTextBanner(
          title: "Suggested Job",
          onPressed: () => Get.toNamed(RouteNames.suggestedJobs),
        ),
        const SizedBox(
          height: 15,
        ),
        GetX<JobPostsController>(
          init: Get.put<JobPostsController>(JobPostsController()),
          builder: (controller) {
            return controller.initialized && controller.jobPosts.isNotEmpty
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
    );
  }
}
