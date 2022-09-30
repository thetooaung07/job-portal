import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/saved_jobs_page_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leading: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: CustomIconButton(
              onTap: (() => Get.back()),
              child: const Icon(
                Icons.chevron_left_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          label: "Saved",
          action: [
            Tooltip(
              showDuration: const Duration(seconds: 1),
              triggerMode: TooltipTriggerMode.tap,
              message: "Swipe left to dismiss Saved Posts",
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                child: const CustomIconButton(
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GetBuilder<SavedJobsPageController>(
            init: Get.put<SavedJobsPageController>(SavedJobsPageController()),
            builder: (controller) {
              return controller.getSavedPosts.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.getSavedPosts.length,
                      padding: const EdgeInsets.symmetric(vertical: 20),
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
                    )
                  : const Center(
                      heightFactor: 50,
                      child: Text("No Saved Posts Yet"),
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
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            alignment: Alignment.centerRight,
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 25, 20, 25),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: const Icon(
                Icons.delete_outline_rounded,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [kCardShadow],
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        margin: const EdgeInsets.only(
            left: kSpacingUnit * 1.5,
            right: kSpacingUnit * 1.5,
            bottom: kSpacingUnit * 2),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
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
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 60,
                                  width: 65,
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
                                  Text(data?.postedBy.username ?? "User"),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                            "$bullet ${differenceInString(data!.createdAt!)} ago"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 18,
                          ),
                          Text(data!.workHour),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.workspace_premium_outlined,
                            size: 18,
                          ),
                          Text(data!.expLevel),
                        ],
                      ),
                      Text(
                        "\$${data!.salary.split("-")[0]}/m",
                        style: kLabelTextStyle.copyWith(
                            color: kPrimaryRedColor, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: -5,
              right: 3,
              child: Icon(
                Icons.bookmark_rounded,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
