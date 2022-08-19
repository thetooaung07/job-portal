import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';

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

    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.jobDetails, arguments: data),
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
        margin: const EdgeInsets.only(
            left: kSpacingUnit * 1.5,
            right: kSpacingUnit * 1.5,
            bottom: kSpacingUnit * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          boxShadow: const [kCardShadow],
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
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            height: 60,
                            width: 60,
                            alignment: Alignment.center,
                            child: data!.postedBy.profile != null
                                ? Image.network(data!.postedBy.profile!)
                                : Image.asset('assets/images/default.png')),
                      ),
                      // SvgPicture.asset(
                      //   "assets/icons/logo_youtube.svg",
                      //   height: 50,
                      //   width: 50,
                      // ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.title ?? "Developer",
                              style: kJobPositionTextStyle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(data?.companyName ?? "User"),
                            const SizedBox(
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
                            () => true == true
                                ? CustomIconButton(
                                    onTap: () {
                                      savedJobsPagecontroller
                                          .addToFavourite(data!);
                                    },
                                    child: const Icon(
                                      Icons.bookmark_rounded,
                                      color: Colors.black87,
                                    ))
                                : CustomIconButton(
                                    onTap: () {
                                      savedJobsPagecontroller
                                          .addToFavourite(data!);
                                    },
                                    child: const Icon(
                                      Icons.bookmark_border_rounded,
                                      color: Colors.black45,
                                    ),
                                  ),
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        "\$ ${data!.salary.split("-")[0]}/m",
                        style: kLabelTextStyle.copyWith(
                            color: kPrimaryRedColor, fontSize: 16),
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
                    Text(data!.workHour),
                    SizedBox(width: 15),
                    Icon(
                      Icons.workspace_premium_outlined,
                      size: 18,
                    ),
                    Text(data!.expLevel),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                      "$bullet ${differenceInString(data!.createdAt!)} ago"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
