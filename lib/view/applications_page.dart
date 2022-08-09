import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/controller/my_application_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApplicationController controller = Get.put(MyApplicationController());
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () => Get.back(),
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "My Applications",
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
                "Applications Stats",
                style: kCaptionTextStyle,
              ),
              jobListDiagram(),
              SizedBox(height: 20),
              Text(
                "Your Last Applications",
                style: kCaptionTextStyle,
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ApplicationCard();
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
  const ApplicationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      height: 125,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [kCardShadow],
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
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: SvgPicture.asset(
                      "assets/icons/logo_youtube.svg",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Facebook"),
                        Text(
                          "Nodejs Developer",
                          style: kJobPositionTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.people_outlined),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  "23 people applied",
                  style: kBodyTextStyle.copyWith(color: Colors.black),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(34, 0, 150, 135),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "\$1200 Monthly",
                  style: kBodyTextStyle.copyWith(
                      color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class jobListDiagram extends StatelessWidget {
  const jobListDiagram({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: Get.width,
      height: 175,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              // width: Get.width / 3,
              margin: EdgeInsets.only(right: 10),
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
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(61, 0, 0, 0)),
                    child: Icon(
                      Icons.my_library_books_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "5 Jobs",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Total Application",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            // color: Colors.teal,
            child: Column(
              children: [
                Expanded(
                  child: HorizontalCard(
                      jobType: "Opened Jobs",
                      job: "2 Jobs",
                      icon: Icons.check_circle_rounded,
                      margin: EdgeInsets.only(bottom: 4),
                      color: Colors.cyan),
                ),
                Expanded(
                  child: HorizontalCard(
                      jobType: "Opened Jobs",
                      job: "2 Jobs",
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
      padding: EdgeInsets.symmetric(horizontal: 15),
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
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Color.fromARGB(61, 0, 0, 0)),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                jobType,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
