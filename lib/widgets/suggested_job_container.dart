import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';
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
        GetX<JobPostsController>(
          init: Get.put<JobPostsController>(JobPostsController()),
          builder: (controller) {
            return controller.initialized && controller.jobPosts.length > 0
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.jobPosts.length,
                    itemBuilder: (context, index) {
                      return JobPostCardVt(
                        data: controller.jobPosts[index],
                      );
                    })
                : SizedBox(
                    height: 100,
                    width: 50,
                    child: Center(child: CircularProgressIndicator()));
          },
        ),
      ],
    );
  }
}


  // ListView.builder(
  //         physics: NeverScrollableScrollPhysics(),
  //         shrinkWrap: true,
  //         itemCount: 4,
  //         itemBuilder: (context, index) => JobPostCardVt(),
  //       )





  /*  StreamBuilder<List<JobPostModel>>(
          stream: FirestoreHelper().jobPostsStream(),
          builder: (context, snapshot) {
            snapshot.connectionState == ConnectionState.active
                ? print("Inside snapshot ${snapshot.data!.length}")
                : null;
            return snapshot.connectionState == ConnectionState.active
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => JobPostCardVt(),
                  )
                : SizedBox(
                    height: 100,
                    width: 50,
                    child: Center(child: CircularProgressIndicator()));
          },
        ), */