import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apple",
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("45 Job vac"),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text("data"),
                  Text("data"),
                ],
              ),
              Container(
                width: Get.width,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Show All"),
                ),
              ),
            ],
          )),
    );
  }
}
