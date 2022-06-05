import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class JobPostCardHr extends StatelessWidget {
  const JobPostCardHr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.jobDetails);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal),
          // TODO: add bg color according to design
          // color: Colors.teal,
          // boxShadow: [kCardShadow],
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        color: Colors.cyanAccent,
                        width: 60,
                        height: 60,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(" Name"),
                    ],
                  ),
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
