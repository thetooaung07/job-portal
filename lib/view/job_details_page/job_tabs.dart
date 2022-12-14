import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/job_posts_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/view/job_details_page/bullet_list_container.dart';
import 'package:job_portal/widgets/custom_tabbar_view.dart';

class JobTab extends StatefulWidget {
  const JobTab({Key? key}) : super(key: key);

  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RxInt tabIndex = 0.obs;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 80),
          decoration: BoxDecoration(
            color: const Color.fromARGB(85, 233, 233, 233),
            // color: jobDetailsTabBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Theme(
            data: ThemeData().copyWith(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: TabBar(
              onTap: (idx) {
                tabIndex.value = idx;
              },
              unselectedLabelColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: kPrimaryRedColor,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: Colors.white,
              controller: _tabController,
              labelStyle: const TextStyle(fontSize: 16),
              tabs: const [
                Tab(
                  height: 40,
                  text: "Overview",
                ),
                // Tab(
                //   height: 40,
                //   text: "Employer",
                // ),
                Tab(
                  height: 40,
                  text: "Review",
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => Custom2TabBarView(
            tabIndex: tabIndex.value,
            firstTab: const Overview(),
            // secondTab: Employer(),
            secondTab: const Review(),
          ),
        )
      ],
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobPostModel placementData =
        Get.find<JobPostsController>().jobPosts[1];
    JobPostModel data = Get.arguments ?? placementData;
    return Column(
      children: [
        //JobDescShort
        const JobDescShort(),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          decoration: BoxDecoration(
            // color: kJobDetailsBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: [
            // Requirements
            BulletListContainer(
              data: data.requirements,
              titile: "Requirements",
            ),
            // Responsibilities
            BulletListContainer(
              data: data.responsibilities,
              titile: "Responsibilities",
            ),
          ]),
        ),
      ],
    );
  }
}

class JobDescShort extends StatelessWidget {
  const JobDescShort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final JobPostModel placementData =
        Get.find<JobPostsController>().jobPosts[1];
    JobPostModel data = Get.arguments ?? placementData;
    return Container(
      width: Get.width,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.fromLTRB(25, 12, 25, 5),
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 10),
      decoration: BoxDecoration(
        color: kJobDetailsBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomIconButton(
                    child: Icon(Icons.work_history_outlined)),
                const SizedBox(
                  height: 10,
                ),
                Text(data.title),
              ],
            ),
          ),
          SizedBox(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomIconButton(child: Icon(Icons.location_on_outlined)),
                const SizedBox(
                  height: 10,
                ),
                Text(data.companyLocation),
              ],
            ),
          ),
          SizedBox(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomIconButton(child: Icon(Icons.history_rounded)),
                const SizedBox(
                  height: 10,
                ),
                Text(data.workHour),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Employer extends StatelessWidget {
  const Employer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Employer Details"));
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Review Tab"),
    );
  }
}
