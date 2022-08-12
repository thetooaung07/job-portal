import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/view/job_details_page/job_tabs.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobDetailsPage extends GetView<JobPostsController> {
  const JobDetailsPage({Key? key}) : super(key: key);

//TODO: Use SilverDeligateAppBar for better UI
//TODO: Replace placementData with Cached data

  @override
  Widget build(BuildContext context) {
    final JobPostModel placementData =
        Get.find<JobPostsController>().jobPosts[1];
    JobPostModel data = Get.arguments ?? placementData;

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
        label: "Details",
        action: [
          GetBuilder<SavedJobsPageController>(
            builder: (controller) => Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: controller.checkAlreadySaved(data.id)
                  ? CustomIconButton(
                      onTap: (() => controller.removeFromFavourite(data)),
                      child: const Icon(
                        Icons.bookmark_rounded,
                        size: 30,
                        color: kPrimaryRedColor,
                      ),
                    )
                  : CustomIconButton(
                      onTap: (() => controller.addToFavourite(data)),
                      child: const Icon(
                        Icons.bookmark_border_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CompanyLogo(),
            // JobDescShort(),
            JobTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarConstraints(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(Get.width * 0.05),
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
          child: const ApplyNowBtn(),
        ),
      ),
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobPostModel placementData =
        Get.find<JobPostsController>().jobPosts[1];
    JobPostModel data = Get.arguments ?? placementData;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: 75,
                width: 75,
                alignment: Alignment.center,
                child: data.postedBy.profile != null
                    ? Image.network(data.postedBy.profile!)
                    : Image.asset('assets/images/default.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Text(
              data.title,
              style: kHeaderTextStyle,
            ),
          ),
          Text(
            data.postedBy.username!,
            style: kCaptionTextStyle,
          ),
        ],
      ),
    );
  }
}

class ApplyNowBtn extends StatelessWidget {
  const ApplyNowBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobPostModel placementData =
        Get.find<JobPostsController>().jobPosts[1];
    JobPostModel data = Get.arguments ?? placementData;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salary/ month",
                style: kBulletListTextStyle.copyWith(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                ("\$${data.salary}"),
                style: kLabelTextStyle.copyWith(color: kPrimaryRedColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GetX<ApplicationsPageController>(
          init:
              Get.put<ApplicationsPageController>(ApplicationsPageController()),
          builder: (appPageController) {
            return GestureDetector(
              onTap: () {
                if (data.postUserId == firebaseAuth.currentUser!.uid) {
                  return;
                }

                if (appPageController.isSelectedJobAlreadyApplied(data.id) ==
                    true) return;
                Get.toNamed(RouteNames.jobApply);
                appPageController.jobPostId.value = data.id;
              },
              child: data.postUserId == firebaseAuth.currentUser!.uid &&
                      !appPageController.isSelectedJobAlreadyApplied(data.id)
                  ? Container(
                      alignment: Alignment.center,
                      width: Get.width / 2,
                      child: const Text(
                        "Sorry!  You cannot apply to your own job",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : data.postUserId != firebaseAuth.currentUser!.uid &&
                          appPageController
                                  .isSelectedJobAlreadyApplied(data.id) ==
                              true
                      ? Container(
                          alignment: Alignment.center,
                          width: Get.width / 2,
                          child: const Text(
                            "You have already applied to this job",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : Container(
                          width: Get.width / 2,
                          // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 75),
                          margin:
                              EdgeInsets.symmetric(vertical: Get.width * 0.01),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child: Text(
                              "Apply Now",
                              style: kLabelTextStyle.copyWith(
                                  fontSize: 20, color: themeBgColor),
                            ),
                          ),
                        ),
            );
          },
        ),
      ],
    );
  }
}
