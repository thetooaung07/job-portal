import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/database.dart';

class JobPostCardVt extends StatelessWidget {
  final bool? includeSave;
  final JobPostModel? data;
  // final bool? isDimissable;

  const JobPostCardVt({Key? key, this.includeSave = false, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SavedJobsPageController savedJobsPagecontroller =
        Get.put(SavedJobsPageController());
    customPrint(data!.postedBy, data!.postedBy);
    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.jobDetails),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 5),
        margin: EdgeInsets.only(
            left: kSpacingUnit * 1.5,
            right: kSpacingUnit * 1.5,
            bottom: kSpacingUnit * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          boxShadow: [kCardShadow],
          color: Colors.white,
        ),
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        child: Image.asset('assets/app_logo.png'),
                      ),
                      // SvgPicture.asset(
                      //   "assets/icons/logo_youtube.svg",
                      //   height: 50,
                      //   width: 50,
                      // ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.title ?? "Developer",
                              style: kJobPositionTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(data?.postedBy ?? "User"),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon(Icons.favorite_outline_rounded),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    includeSave == true
                        ? Obx(
                            () => CustomIconButton(
                              onTap: () {
                                savedJobsPagecontroller.addToFavourite();
                              },
                              child: savedJobsPagecontroller.isFavourite.value
                                  ? Icon(
                                      Icons.bookmark_rounded,
                                      color: Colors.black87,
                                    )
                                  : Icon(
                                      Icons.bookmark_border_rounded,
                                      color: Colors.black45,
                                    ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        "\$1299/Mo",
                        style: kLabelTextStyle.copyWith(
                            color: kPrimaryRedColor, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                    ),
                    Text("Full Time"),
                    SizedBox(width: 15),
                    Icon(
                      Icons.workspace_premium_outlined,
                      size: 18,
                    ),
                    Text("Mid-Senior"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text("${bullet}23 min ago"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BubbleContainer extends StatelessWidget {
  final Widget child;
  const BubbleContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[300]),
      child: child,
    );
  }
}
