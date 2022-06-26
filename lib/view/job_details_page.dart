import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

//TODO: Use SilverDeligateAppBar for better UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        onTap: () {},
                        child: Icon(
                          Icons.notifications_none_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Detail",
                        style: kLogoTextStyle,
                      ),
                      CustomIconButton(
                        child: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),
            ),
            CompanyLogo(),
            JobTab(),
            // ApplyNowBtn(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: Colors.white,
        height: 100,
        child: ApplyNowBtn(),
      ),
    );
  }
}

class JobTabs extends StatelessWidget {
  const JobTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: PageView(children: []),
      ),
    );
  }
}

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
            color: themeBgColor,
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

                print(idx);
              },
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: btnBgColorRed,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              controller: _tabController,
              tabs: [
                Tab(
                  height: 40,
                  text: "Overview",
                ),
                Tab(
                  height: 40,
                  text: "Company",
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
            firstTab: FirstTab(),
            secondTab: FirstTab(),
            thirdTab: FirstTab(),
          ),
        )
        // Container(
        //   width: Get.width,
        //   height: 550,
        //   child: TabBarView(
        //     controller: _tabController,
        //     children: [
        //       SingleChildScrollView(
        // child: Column(
        //   children: [
        //     // Responsibilities
        //     Responsibilities(),
        //     // Qualifications
        //     Qualifications(),
        //     Qualifications(),
        //     // ApplyNowBtn
        //     // ApplyNowBtn(),
        //   ],
        // ),
        // ),
        //       Text("Tab Bar View 2"),
        //       Text("Tab Bar View 3"),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Responsibilities
        Responsibilities(),
        // Qualifications
        Qualifications(),
        Qualifications(),
        // ApplyNowBtn
        // ApplyNowBtn(),
      ],
    );
  }
}

class CustomTabBarView extends StatelessWidget {
  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;
  final Widget thirdTab;

  const CustomTabBarView({
    Key? key,
    required this.tabIndex,
    required this.firstTab,
    required this.secondTab,
    required this.thirdTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform:
              Matrix4.translationValues(tabIndex == 0 ? 0 : -Get.width, 0, 0),
          duration: Duration(milliseconds: 175),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform: Matrix4.translationValues(
              tabIndex == 1
                  ? 0
                  : tabIndex == 2
                      ? -Get.width
                      : Get.width,
              0,
              0),
          duration: Duration(milliseconds: 175),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: thirdTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          transform:
              Matrix4.translationValues(tabIndex == 2 ? 0 : Get.width, 0, 0),
          duration: Duration(milliseconds: 175),
          curve: Curves.easeIn,
        )
      ],
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: 75,
            height: 75,
            decoration: BoxDecoration(color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Text(
              "UI/ UX Designer",
              style: kHeaderTextStyle,
            ),
          ),
          Text(
            "Youtube",
            style: kCaptionTextStyle,
          ),
        ],
      ),
    );
  }
}

class Responsibilities extends StatelessWidget {
  const Responsibilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Text(
            "Responsibilities",
            style: kLabelTextStyle,
          ),
        ),
        BulletText(),
        BulletText(),
        BulletText(),
        BulletText(),
      ],
    );
  }
}

class Qualifications extends StatelessWidget {
  const Qualifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Minimum Qualifications",
            style: kLabelTextStyle,
          ),
        ),
        BulletText(),
        BulletText(),
        BulletText(),
        BulletText(),
      ],
    );
  }
}

class BulletText extends StatelessWidget {
  const BulletText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 1.5),
            child: Icon(
              Icons.fiber_manual_record_rounded,
              size: 11,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
                "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Salary",
              style: kCaptionTextStyle,
            ),
            Text(
              "\$1000/Mo",
              style: kHeaderTextStyle.copyWith(color: btnBgColorRed),
            ),
          ],
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 75),
            height: 60,
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
        ),
      ],
    );
  }
}
