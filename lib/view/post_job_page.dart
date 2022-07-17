import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/job_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/custom_expansion_tile.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class PostJobPage extends GetView<JobController> {
  const PostJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JobController());

    int maxLines = 7;

    return Scaffold(
      backgroundColor: themeBgMainColor,
      appBar: MyAppBar(
        backgroundColor: Colors.transparent,
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
        label: "Create Job",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {},
              child: Icon(
                Icons.clear_all_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 20),
                //   child: Text(
                //     "Job Description",
                //     style: kCaptionTextStyle,
                //   ),
                // ),
                JobSection(
                  sectionIcon: Icon(Icons.local_activity_outlined),
                  sectionTitle: 'About Position',
                  children: [
                    WithLabelTFField(
                      label: "Title",
                      controller: controller.titleC,
                    ),
                    WithLabelTFField(
                      label: "Tech Skills",
                      controller: controller.techSkillC,
                    ),
                    WithLabelTFField(
                      controller: controller.expLevelC,
                      label: "Experience Level",
                    ),
                    //!TODO Change UI for Salary

                    WithLabelTFField(
                      controller: controller.salaryC,
                      label: "Salary",
                      hintText: "1200 - 1500",
                      extendedWidget: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("in USD"),
                            Text("per month"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                JobSection(
                  sectionTitle: "Company",
                  sectionIcon: Icon(Icons.work),
                  children: [
                    WithLabelTFField(
                      controller: controller.companyLocationC,
                      label: "Location",
                    ),
                    WithLabelTFField(
                      controller: controller.companyNameC,
                      label: "Name",
                    ),
                    WithLabelTFField(
                      controller: controller.companyWebsiteC,
                      label: "Website",
                    ),
                    WithLabelTFField(
                      controller: controller.companyContactMailC,
                      label: "Contact Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Job Description",
                    style: kCaptionTextStyle,
                  ),
                ),
                JobSection(
                  sectionIcon: Icon(Icons.event_note_rounded),
                  sectionTitle: "Requirements",
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 10, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Please add full-stop(.) at the end of each sentence\nor press enter to move to next line",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 30 * maxLines.toDouble(),
                      child: TextField(
                        controller: controller.requirementsC,
                        style: TextStyle(fontSize: 17),
                        maxLines: maxLines,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black45),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.transparent),
                            ),
                            // focusedBorder: InputBorder.none,
                            // enabledBorder: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            // disabledBorder: InputBorder.none,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black26,
                            ),
                            hintText: "Enter Job Description",
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                  ],
                ),
                JobSection(
                  sectionIcon: Icon(Icons.event_available_rounded),
                  sectionTitle: "Responsibilities",
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 10, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              "Please add full-stop(.) at the end of each sentence\nor press enter to move to next line",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      height: 30 * maxLines.toDouble(),
                      child: TextField(
                        controller: controller.responsibilitiesC,
                        style: TextStyle(fontSize: 17),
                        maxLines: maxLines,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.black45),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.transparent),
                            ),
                            // focusedBorder: InputBorder.none,
                            // enabledBorder: InputBorder.none,
                            // errorBorder: InputBorder.none,
                            // disabledBorder: InputBorder.none,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black26,
                            ),
                            hintText: "Enter Job Description",
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () => controller.printController(),
                        child: Text("Print")),
                    ElevatedButton(
                        onPressed: () => controller.createJobPost(),
                        child: Text("Post")),
                    ElevatedButton(
                        onPressed: () => controller.clear(),
                        child: Text("Clear")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//

class JobSection extends StatelessWidget {
  final String sectionTitle;
  final Widget? sectionIcon;
  final List<Widget> children;
  const JobSection({
    Key? key,
    this.sectionIcon,
    this.children = const [],
    required this.sectionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(26, 204, 204, 204),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            // splashColor: Colors.transparent,
            dividerColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 10),
          leading: sectionIcon,
          title: Text(
            "$sectionTitle",
            style: TextStyle(fontSize: 20),
          ),
          children: children,
        ),
      ),
    );
  }
}

class WithLabelTFField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? extendedWidget;
  const WithLabelTFField({
    Key? key,
    this.controller,
    this.hintText,
    this.extendedWidget,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        // borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              height: Get.height,
              width: 120,
              child: Text(
                label + " :",
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: TextFormField(
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: hintText ?? label,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ),
          extendedWidget ?? SizedBox(),
        ],
      ),
    );
  }
}
// class WithBulletTFField extends StatelessWidget {
//   const WithBulletTFField({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50, // change back to 50 to center hint text
//       margin: EdgeInsets.only(top: 5, bottom: 5, left: 10),
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.centerLeft,
//             height: Get.height,
//             child: Icon(
//               Icons.fiber_manual_record_rounded,
//               size: 14,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.fromLTRB(10, 0, 0, 5),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               child: TextFormField(
//                 maxLines: 2,
//                 textAlign: TextAlign.start,
//                 textAlignVertical: TextAlignVertical.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.black54,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   filled: true,
//                   fillColor: Colors.transparent,
//                   hintText: "label",
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 18,
//                     color: Colors.black26,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
