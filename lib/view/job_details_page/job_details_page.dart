import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/view/job_details_page/job_tabs.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobDetailsPage extends GetView<JobPostsController> {
  const JobDetailsPage({Key? key}) : super(key: key);

//TODO: Use SilverDeligateAppBar for better UI

  @override
  Widget build(BuildContext context) {
    JobPostModel data = Get.arguments as JobPostModel;
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: (() => Get.back()),
            child: Icon(
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
              margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: controller.checkAlreadySaved(data.id)
                  ? CustomIconButton(
                      onTap: (() => controller.removeFromFavourite(data)),
                      child: Icon(
                        Icons.bookmark_rounded,
                        size: 30,
                        color: kPrimaryRedColor,
                      ),
                    )
                  : CustomIconButton(
                      onTap: (() => controller.addToFavourite(data)),
                      child: Icon(
                        Icons.bookmark_border_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CompanyLogo(),
            JobTab(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarConstraints(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.all(Get.width * 0.05),
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
          child: ApplyNowBtn(),
        ),
      ),
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobPostModel data = Get.arguments as JobPostModel;
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
                child: Get.arguments!.postedBy.profile != null
                    ? Image.network(Get.arguments!.postedBy.profile!)
                    : Image.asset('assets/images/default.png')),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Text(
              Get.arguments.title,
              style: kHeaderTextStyle,
            ),
          ),
          Text(
            Get.arguments.postedBy.username,
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
    JobPostModel data = Get.arguments as JobPostModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
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
        SizedBox(
          width: 10,
        ),
        Container(
          width: Get.width / 2,
          // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 75),
          margin: EdgeInsets.symmetric(vertical: Get.width * 0.01),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              "Apply Now",
              style:
                  kLabelTextStyle.copyWith(fontSize: 20, color: themeBgColor),
            ),
          ),
        ),
      ],
    );
  }
}
