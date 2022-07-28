import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ShowApplicantsPage extends GetView<ApplicationsPageController> {
  const ShowApplicantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationsPageController controller =
        Get.put(ApplicationsPageController());
    return Scaffold(
        appBar: MyAppBar(
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: CustomIconButton(
              onTap: () {
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
                  children: [
                    Text("View by"),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      color: Colors.white,
                      width: 80,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        dropdownColor: Colors.white,
                        value: controller.selectedVal,
                        onChanged: (v) {
                          // selectedItem.value = v.toString();
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
                    )
                  ],
                ),

                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   scrollDirection: Axis.vertical,
                //   itemCount: 4,
                //   itemBuilder: (context, index) {
                //     return ApplicantCard();
                //   },
                // )

                ExpansionPanelList(
                  children: List<ExpansionPanel>.generate(
                    controller.expansionOpen.length,
                    (index) => ExpansionPanel(
                        isExpanded: controller.expansionOpen[0],
                        headerBuilder: (context, isExpanded) {
                          return Text("Hello");
                        },
                        body: Text("Now Open")),
                  ).toList(),
                  expansionCallback: (i, isOpen) {
                    controller.expansionOpen[i] = !isOpen;
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class ApplicantCard extends StatelessWidget {
  const ApplicantCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("D"),
    );
  }
}




/* Container(
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor: Colors.red,
              labelColor: Colors.black,
              controller: controller,
              tabs: [
                Tab(
                  text: "Apply",
                ),
                Tab(
                  text: "Shortlisted",
                ),
                Tab(
                  text: "Interview",
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  Container(
                    child: Text("TAb bar1"),
                  ),
                  Container(
                    child: Text("TAb bar2"),
                  ),
                  Container(
                    child: Text("TAb bar3"),
                  ),
                ],
              ),
            )
          ],
        ),
      ), */