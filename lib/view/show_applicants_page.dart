import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ShowApplicantsPage extends GetView<ApplicationsPageController> {
  const ShowApplicantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationsPageController controller =
        Get.find<ApplicationsPageController>();
    JobPostModel data = Get.arguments;

    // TODO try to change the code placement since it can duplicate applicants since method is call on widget build

    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              controller.applicantsForSelectedJobPost.clear();
              Get.back();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Applicants",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                Get.back();
                Get.find<BottomNavBarController>().selectedIndex.value = 1;
              },
              child: Icon(
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
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Filter by"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.white,
                    width: 120,
                    child: Obx(
                      () => DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        dropdownColor: Colors.white,
                        value: controller.selectedVal,
                        onChanged: (v) {
                          controller.selectedVal = v.toString();
                        },
                        items: DropdownList.map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text("$item"),
                            ),
                          ),
                        ).toList(),
                      ),
                    ),
                  )
                ],
              ),
              Obx(() => ListView.builder(
                    itemCount: controller.applicantsForSelectedJobPost.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ApplicantCard();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicantCard extends StatelessWidget {
  const ApplicantCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
      ),
      child: Text("D"),
    );
  }
}
