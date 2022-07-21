import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/widgets/job-post-card-hr.dart';
import 'package:job_portal/widgets/showAllTextBanner.dart';
import 'package:job_portal/routes/routes.dart';

class TopCompanyContainer extends StatelessWidget {
  const TopCompanyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        ShowAllTextBanner(
          title: "Top Company",
          onPressed: () => Get.toNamed(RouteNames.popularJobs),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 210,
          child: GetX<JobPostsController>(
              init: Get.put<JobPostsController>(JobPostsController()),
              builder: (controller) {
                return controller.initialized && controller.jobPosts.length > 0
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
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, right: 10),
                        child: Center(child: CircularProgressIndicator()),
                      );
              }),
        ),
      ],
    );
  }
}
