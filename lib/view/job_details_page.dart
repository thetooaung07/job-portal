import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

//TODO: Use SilverDeligateAppBar for better UI

  @override
  Widget build(BuildContext context) {
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
        label: "QWERTY",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: (() => Get.toNamed(RouteNames.search)),
              child: Icon(
                Icons.bookmark_border_rounded,
                size: 30,
                color: Colors.black,
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
      ],
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Requirements(),
              // Responsibilities
              Responsibilities(),
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
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.fromLTRB(50, 12, 50, 5),
      decoration: BoxDecoration(
        color: kJobDetailsBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(child: Icon(Icons.work_history_outlined)),
              SizedBox(
                height: 10,
              ),
              Text("Design"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(child: Icon(Icons.location_on_outlined)),
              SizedBox(
                height: 10,
              ),
              Text("USA NewYork"),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(child: Icon(Icons.history_rounded)),
              SizedBox(
                height: 10,
              ),
              Text("Full Time"),
            ],
          ),
        ],
      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
          SvgPicture.asset(
            "assets/icons/logo_youtube.svg",
            height: 75,
            width: 75,
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
          padding: EdgeInsets.only(bottom: 25, top: 10),
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

class Requirements extends StatelessWidget {
  const Requirements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 25, top: 10),
          child: Text(
            "Requirements",
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
      padding: const EdgeInsets.only(bottom: 10.0, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.fiber_manual_record_rounded,
              size: 11,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether ",
              style: kBulletListTextStyle,
            ),
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
              style: kBulletListTextStyle.copyWith(
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Text(
              "\$1000/Month",
              style: kHeaderTextStyle.copyWith(color: kPrimaryRedColor),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
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
        ),
      ],
    );
  }
}
