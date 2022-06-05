import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/showAllTextBanner.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class RecentPostsContainer extends StatelessWidget {
  const RecentPostsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllTextBanner(
          title: "Recent Posts",
          onPressed: () => Get.toNamed(RouteNames.recentPosts),
        ),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
      ],
    );
  }
}
