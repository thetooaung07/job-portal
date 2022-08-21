import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationsPageController controller =
        Get.put(ApplicationsPageController());
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "My Applications",
        action: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                Get.back();
                Get.find<BottomNavBarController>().selectedIndex.value = 1;
              },
              child: const Icon(
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
              const Text(
                "Applications Stats",
                style: kCaptionTextStyle,
              ),
              JobCountDiagram(controller: controller),
              const SizedBox(height: 20),
              const Text(
                "Your Last Applications",
                style: kCaptionTextStyle,
              ),
              const SizedBox(height: 20),
              GetX<ApplicationsPageController>(
                builder: (controller) {
                  print(
                      "myApplicationList =>  ${controller.myApplicationList.length}");
                  print(
                      "appliedJobsList =>  ${controller.appliedJobsList.length}");
                  return controller.myApplicationList.isNotEmpty &&
                          controller.appliedJobsList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.appliedJobsList.length,
                          itemBuilder: (context, index) {
                            return ApplicationCard(
                                data: controller.appliedJobsList[index]);
                          },
                        )
                      : const Center(
                          child: Text("You haven't Applied any Jobs Recently",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationCard extends StatelessWidget {
  final JobPostModel data;
  const ApplicationCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.jobDetails, arguments: data);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        height: 125,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [kCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            child: data.postedBy.profile != null
                                ? Image.network(data.postedBy.profile!)
                                : Image.asset('assets/images/default.png')),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.companyName),
                          Text(
                            data.title,
                            style: kJobPositionTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_vert_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.people_outlined),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    // TODO count number of people applied to this job
                    "23 people applied",
                    style: kBodyTextStyle.copyWith(color: Colors.black),
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(34, 0, 150, 135),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "\$${data.salary.split("-")[1]} Monthly",
                    style: kBodyTextStyle.copyWith(
                        color: Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JobCountDiagram extends StatelessWidget {
  final ApplicationsPageController controller;
  const JobCountDiagram({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: Get.width,
      height: 175,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              // width: Get.width / 3,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal,
              ),
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(61, 0, 0, 0)),
                    child: const Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetX<ApplicationsPageController>(
                    builder: (controller) {
                      int count = controller.appliedJobsList.length;

                      return Text(
                        "$count Jobs",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Total Applications",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            // color: Colors.teal,
            child: Column(
              children: [
                Expanded(
                    child: HorizontalCard(
                        jobType: "Opening Jobs",
                        job: "0",
                        icon: Icons.check_circle_rounded,
                        margin: const EdgeInsets.only(bottom: 4),
                        color: Colors.green.shade500)),
                const Expanded(
                  child: HorizontalCard(
                      jobType: "Expired Jobs",
                      job: "0",
                      icon: Icons.cancel_rounded,
                      margin: EdgeInsets.only(top: 4),
                      color: Color.fromARGB(255, 255, 82, 70)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final EdgeInsets margin;
  final Color color;
  final IconData icon;
  final String job;
  final String jobType;

  const HorizontalCard({
    required this.margin,
    required this.color,
    required this.icon,
    required this.job,
    required this.jobType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color.fromARGB(61, 0, 0, 0)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$job Jobs",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                jobType,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
