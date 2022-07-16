import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class PostJobPage extends StatelessWidget {
  const PostJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onTap: (() => Get.toNamed(RouteNames.search)),
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
        child: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                JobSection(
                  sectionTitle: "Applicant Profile",
                  sectionIcon: Icon(Icons.person),
                  children: [
                    WithLabelTFField(
                      label: "Title",
                    ),
                    WithLabelTFField(
                      label: "Experience Level",
                    ),
                    WithLabelTFField(
                      label: "Tech Skills",
                    ),
                    WithLabelTFField(
                      label: "Salary",
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
                      label: "Location",
                    ),
                    WithLabelTFField(
                      label: "Name",
                    ),
                    WithLabelTFField(
                      label: "Website",
                    ),
                    WithLabelTFField(
                      label: "Contact Email",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                JobSection(
                  sectionTitle: "Job Description",
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
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
                      height: 24 * 5,
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        maxLines: 5,
                        decoration: InputDecoration(
                            hintText: "Enter Job Description",
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
  const WithLabelTFField({
    Key? key,
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
                  hintText: label,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ),
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
