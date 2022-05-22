import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/showAllTextBanner.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class RecentPosts extends StatelessWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllTextBanner(
          title: "Recent Posts",
          onPressed: () => Get.toNamed(RouteNames.recentPosts),
        ),
        RecentPostCard(),
        RecentPostCard(),
        RecentPostCard(),
        RecentPostCard(),
      ],
    );
  }
}

class RecentPostCard extends StatelessWidget {
  const RecentPostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      margin: EdgeInsets.only(
          left: kSpacingUnit * 1.5,
          right: kSpacingUnit * 1.5,
          bottom: kSpacingUnit * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal,
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                color: Colors.cyan,
                width: 45,
                height: 45,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Facebook"),
                          Text(
                            "UI/UX Designer",
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                      Icon(Icons.favorite_outline),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10.0),
                //   child: Text(
                //     "UI/UX Designer",
                //     style: kTitleTextStyle,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("\$140K/month"),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Text(
                                  "USA Califonia sadasda",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text("Full-timeasdadasdasd"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("12h"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
