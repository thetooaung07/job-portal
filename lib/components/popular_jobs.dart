import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/constants.dart';

class PopularJobs extends StatelessWidget {
  const PopularJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Popular Jobs"),
            OutlinedButton(
              onPressed: () {},
              child: Text("See All"),
            ),
          ],
        ),
        PopularJobCard(),
      ],
    );
  }
}

class PopularJobCard extends StatelessWidget {
  const PopularJobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.teal,
      width: 250,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.red,
                    width: 40,
                    height: 40,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Salary"),
              Text("Location"),
              Text("Full Time"),
            ],
          )
        ],
      ),
    );
  }
}
