import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/job_post_card_hr.dart';
import 'package:job_portal/widgets/show_all_text_banner.dart';

class TopCompanyContainer extends StatelessWidget {
  const TopCompanyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        ShowAllTextBanner(
          title: "Recent Posts",
          onPressed: () => Get.toNamed(RouteNames.recentPosts),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 240,
          child: GetX<JobPostsController>(
              init: Get.put<JobPostsController>(JobPostsController()),
              builder: (controller) {
                return controller.initialized && controller.jobPosts.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.jobPosts.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                          child: JobPostCardHr(
                            data: controller.jobPosts[index],
                          ),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(bottom: 20.0, right: 10),
                        child: Center(child: CircularProgressIndicator()),
                      );
              }),
        ),
      ],
    );
  }
}
