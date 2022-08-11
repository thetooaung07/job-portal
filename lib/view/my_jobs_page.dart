import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class MyJobsPage extends StatelessWidget {
  const MyJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "My Jobs",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                Get.back();
                Get.find<BottomNavBarController>().selectedIndex.value = 1;
              },
              child: Icon(
                Icons.search_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jobs you are offering to others: ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(
                    Icons.not_listed_location_outlined,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      "Find the people you need for your business",
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GetX<JobPostsController>(builder: (controller) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.userJobPosts.length,
                    itemBuilder: (context, index) {
                      return MyJobCard(
                        data: controller.userJobPosts[index],
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}

class MyJobCard extends StatelessWidget {
  final JobPostModel data;
  const MyJobCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            GestureDetector(
              onTap: (() =>
                  Get.toNamed(RouteNames.jobDetails, arguments: data)),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.companyName,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          data.createdAt.toString().split(" ")[0],
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "${data.expLevel} ${data.title}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          data.companyLocation,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Icon(
                            Icons.fiber_manual_record_rounded,
                            size: 10,
                          ),
                        ),
                        Text(
                          "\$${data.salary.split("-")[0]} / month",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Icon(
                            Icons.fiber_manual_record_rounded,
                            size: 10,
                          ),
                        ),
                        Text(
                          "Full Time",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black87,
            ),
            GestureDetector(
              onTap: () {
                Get.put(ApplicationsPageController())
                    .getApplicantsFromPostedJobPosts(data.id);
                Get.toNamed(RouteNames.showApplicants, arguments: data);
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Show Applicants"),
                    Icon(Icons.chevron_right_rounded),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
