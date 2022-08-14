import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ShowApplicantsPage extends GetView<ApplicationsPageController> {
  const ShowApplicantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationsPageController controller =
        Get.find<ApplicationsPageController>();
    // JobPostModel data = Get.arguments;

    // TODO try to change the code placement since it can duplicate applicants since method is call on widget build

    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Applicants",
        action: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                Get.back();
                Get.find<BottomNavBarController>().selectedIndex.value = 1;
              },
              child: const Icon(
                Icons.search_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Filter by"),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.white,
                    width: 120,
                    child: Obx(
                      () => DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        dropdownColor: Colors.white,
                        value: controller.selectedVal,
                        onChanged: (v) {
                          controller.selectedVal = v.toString();
                        },
                        items: dropdownList
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("$item"),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
              GetX<ApplicationsPageController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.applicantList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, idx) {
                      return controller.applicantList.isNotEmpty &&
                              controller.applicantsForSelectedJobPost.isNotEmpty
                          ? ApplicantCard(
                              index: idx,
                              user: controller.applicantList[idx],
                              applicant:
                                  controller.applicantsForSelectedJobPost[idx],
                            )
                          : const Text("No Data");
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicantCard extends StatelessWidget {
  final int index;
  final UserAccount user;
  final ApplicantModel applicant;

  const ApplicantCard({
    Key? key,
    required this.index,
    required this.user,
    required this.applicant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.viewApplicantDetails,
            arguments: [user, applicant, index]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [kCardShadow],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  child: user.profile != null
                      ? Image.network(user.profile!)
                      : Image.asset('assets/images/default.png'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username!,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    applicant.email!,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    applicant.phoneNumber!,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GetBuilder<ApplicationsPageController>(
              builder: (controller) {
                return RotatedBox(
                  quarterTurns: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                        color: applicationProcessMatchColor(controller
                                .applicantsForSelectedJobPost[index]
                                .applicationProcess ??
                            ApplicationProcess.unknown),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      controller.applicantsForSelectedJobPost[index]
                              .applicationProcess ??
                          ApplicationProcess.unknown,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shadows: [kIconShadow]),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
