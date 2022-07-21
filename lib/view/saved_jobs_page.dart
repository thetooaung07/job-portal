import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({Key? key}) : super(key: key);

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
          label: "Saved",
          action: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: CustomIconButton(
                onTap: () {},
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<SavedJobsPageController>(
            init: Get.put<SavedJobsPageController>(SavedJobsPageController()),
            builder: (controller) {
              return ListView.builder(
                itemCount: controller.getSavedPosts.length,
                padding: EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero, () {
                      Get.toNamed(RouteNames.jobDetails,
                          arguments: controller.getSavedPosts[index]);
                    });
                  },
                  child: DismissibleJobPostCard(
                    index: index,
                    data: controller.getSavedPosts[index],
                  ),
                ),
              );
            }));
  }
}

class DismissibleJobPostCard extends StatelessWidget {
  final int index;
  final JobPostModel? data;

  const DismissibleJobPostCard({Key? key, required this.index, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          Get.find<SavedJobsPageController>().removeFromFavourite(data!);
        }
      },
      background: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Container(
          //   margin: EdgeInsets.only(bottom: 15),
          //   // padding: EdgeInsets.only(right: 20),
          //   alignment: Alignment.centerLeft,
          //   color: Colors.transparent,
          //   child: Container(
          //     padding: EdgeInsets.fromLTRB(20, 25, 30, 25),
          //     decoration: BoxDecoration(
          //         color: Colors.teal,
          //         borderRadius: BorderRadius.only(
          //           topRight: Radius.circular(20),
          //           bottomRight: Radius.circular(20),
          //         )),
          //     child: Icon(
          //       Icons.folder_open_rounded,
          //       size: 25,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            // padding: EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 25, 20, 25),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Icon(
                Icons.delete_outline_rounded,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(
            left: kSpacingUnit * 1.5,
            right: kSpacingUnit * 1.5,
            bottom: kSpacingUnit * 2),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
              // margin: EdgeInsets.only(
              //     left: kSpacingUnit * 1.5,
              //     right: kSpacingUnit * 1.5,
              //     bottom: kSpacingUnit * 2),
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                      : Image.asset(
                                          'assets/images/default.png')),
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
                              height: 70,
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
                                  Text(data?.postedBy.username ?? "User"),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "\$1299/Mo",
                          style: kLabelTextStyle.copyWith(
                              color: kPrimaryRedColor, fontSize: 18),
                        ),
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
                      Text("${bullet}23 min ago"),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.bookmark_rounded,
                    size: 30,
                    color: kPrimaryRedColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
