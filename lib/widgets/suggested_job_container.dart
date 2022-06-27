import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/showAllTextBanner.dart';
import 'package:job_portal/routes/routes.dart';

class SuggestedJobContainer extends StatelessWidget {
  const SuggestedJobContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllTextBanner(
          title: "Suggested Job",
          onPressed: () => Get.toNamed(RouteNames.recentPosts),
        ),
        SizedBox(
          height: 15,
        ),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
        JobPostCardVt(),
      ],
    );
  }
}
