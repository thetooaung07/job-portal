import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/routes/routes.dart';

class JobPostCardHr extends StatelessWidget {
  final JobPostModel? data;
  const JobPostCardHr({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: const [kCardShadow],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      child: data!.postedBy.profile != null
                          ? Image.network(data!.postedBy.profile!)
                          : Image.asset('assets/images/default.png')),
                ),

                // SvgPicture.asset(
                //   "assets/icons/logo_youtube.svg",
                //   height: 40,
                // ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data?.postedBy.username ?? "Company Name",
                        style: kLabelTextStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("45 Job vacancy"),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$bullet \$${data!.salary} / Mo"),
                const SizedBox(
                  height: 5,
                ),
                Text(
                    "$bullet ${data!.workHour} / ${data!.workType == "Work From Home" ? "WFH" : data!.workType}"),
              ],
            ),
            CustomTextButton(onTap: () {
              Get.toNamed(RouteNames.jobDetails, arguments: data);
            }),
          ],
        ));
  }
}

class CustomTextButton extends StatelessWidget {
  final String? label;
  final void Function()? onTap;

  const CustomTextButton({Key? key, this.label = "Show More", this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: btnBgColorGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label ?? "Show More",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
