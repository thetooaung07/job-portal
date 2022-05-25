import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/showAllTextBanner.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class PopularJobs extends StatelessWidget {
  const PopularJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowAllTextBanner(
          title: "Popular Jobs",
          onPressed: () => Get.toNamed(RouteNames.popularJobs),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          height: 175,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => PopularJobCard(),
          ),
        )
      ],
    );
  }
}

class PopularJobCard extends StatelessWidget {
  const PopularJobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.jobDetails);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.teal,
            boxShadow: [kCardShadow]),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.cyanAccent,
                      width: 45,
                      height: 45,
                    ),
                    Text(" Name"),
                  ],
                ),
                Icon(Icons.favorite_border_outlined),
              ],
            ),
            Text(
              "Job Position",
              style: kTitleTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Salary"),
                Text("Location"),
                Text("Full Time"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
