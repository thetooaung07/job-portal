import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
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
    _tabController = TabController(length: 3, vsync: this);
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Color.fromARGB(85, 233, 233, 233),
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
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              controller: _tabController,
              labelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(
                  height: 40,
                  text: "Overview",
                ),
                Tab(
                  height: 40,
                  text: "Employer",
                ),
                Tab(
                  height: 40,
                  text: "Review",
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => CustomTabBarView(
            tabIndex: tabIndex.value,
            firstTab: Overview(),
            secondTab: Employer(),
            thirdTab: Review(),
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
    JobPostModel data = Get.arguments as JobPostModel;
    return Container(
      child: Column(
        children: [
          //JobDescShort
          JobDescShort(),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: kJobDetailsBgColor,
                borderRadius: BorderRadius.circular(20)),
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
      ),
    );
  }
}

class JobDescShort extends StatelessWidget {
  const JobDescShort({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    JobPostModel data = Get.arguments as JobPostModel;
    return Container(
      width: Get.width,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.fromLTRB(25, 12, 25, 5),
      padding: EdgeInsets.fromLTRB(0, 12, 0, 10),
      decoration: BoxDecoration(
        color: kJobDetailsBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(child: Icon(Icons.work_history_outlined)),
                SizedBox(
                  height: 10,
                ),
                Text(data.title),
              ],
            ),
          ),
          Container(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(child: Icon(Icons.location_on_outlined)),
                SizedBox(
                  height: 10,
                ),
                Text(data.companyLocation),
              ],
            ),
          ),
          Container(
            width: (Get.width - 50) / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(child: Icon(Icons.history_rounded)),
                SizedBox(
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
    return Container(
      child: Center(child: Text("Employer Details")),
    );
  }
}

class Review extends StatelessWidget {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Review Tab"),
      ),
    );
  }
}
