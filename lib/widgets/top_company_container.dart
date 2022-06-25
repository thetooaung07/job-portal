import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        ShowAllTextBanner(
          title: "Top Company",
          onPressed: () => Get.toNamed(RouteNames.popularJobs),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: JobPostCardHr(),
            ),
          ),
        )
      ],
    );
  }
}
