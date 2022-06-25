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
            // App Bar

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

            // Company Logo
            CompanyLogo(),
            // 3 Column Row
            JobTab(),
            //Responsibilites
            Responsibilities(),
            // Qualifications
            Qualifications(),

            //ApplyNowBtn
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Apply Now",
                          style: kLabelTextStyle.copyWith(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: kSilverColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.teal, width: 2)),
                        child: Icon(Icons.bookmark_border_rounded)),
                  ),
                ],
              ),
            ),
          ],
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
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Container(
      child: TabBar(controller: _tabController, tabs: [
        Tab(
          text: "Overview",
        ),
        Tab(
          text: "Company",
        ),
        Tab(
          text: "Review",
        ),
      ]),
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
          padding: EdgeInsets.symmetric(vertical: 15),
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
      padding: const EdgeInsets.only(bottom: 10.0),
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
