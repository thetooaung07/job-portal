import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/job_create_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class PostJobPage extends GetView<JobCreateController> {
  const PostJobPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JobCreateController());

    int maxLines = 7;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                onTap: () {
                  controller.clear();
                },
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
                        hintText: "Enter position (eg. React Developer )",
                        label: "Title",
                        controller: controller.titleC,
                      ),
                      WithLabelTFField(
                        hintText: "JavaScript, Nodejs",
                        label: "Tech Skills",
                        controller: controller.techSkillC,
                      ),
                      WithLabelTFField(
                        hintText: "Mid-Senior",
                        controller: controller.expLevelC,
                        label: "Experience Level",
                      ),
                      WithLabelTFField(
                        hintText: "9am - 5pm",
                        controller: controller.workHourC,
                        label: "Work Hour",
                      ),

                      Obx(
                        () => Row(
                          children: [
                            Radio<String>(
                                activeColor: Colors.black,
                                value: "Company",
                                groupValue: controller.selectedType.value,
                                onChanged: (value) {
                                  print(value);
                                  controller.selectedType.value = value!;
                                }),
                            Text(
                              "Company",
                              style: TextStyle(
                                  fontWeight:
                                      controller.selectedType.value == "Company"
                                          ? FontWeight.w700
                                          : FontWeight.normal),
                            ),
                            Radio<String>(
                                activeColor: Colors.black,
                                value: "Work From Home",
                                groupValue: controller.selectedType.value,
                                onChanged: (value) {
                                  controller.selectedType.value = value!;
                                }),
                            Text(
                              "Work From Home",
                              style: TextStyle(
                                  fontWeight: controller.selectedType.value ==
                                          "Work From Home"
                                      ? FontWeight.w700
                                      : FontWeight.normal),
                            ),
                            Radio<String>(
                                activeColor: Colors.black,
                                value: "Hybrid",
                                groupValue: controller.selectedType.value,
                                onChanged: (value) {
                                  controller.selectedType.value = value!;
                                }),
                            Text(
                              "Hybrid",
                              style: TextStyle(
                                  fontWeight:
                                      controller.selectedType.value == "Hybrid"
                                          ? FontWeight.w700
                                          : FontWeight.normal),
                            ),
                          ],
                        ),
                      ),

                      //!TODO Change UI for Salary

                      WithLabelTFField(
                        controller: controller.salaryC,
                        label: "Salary",
                        hintText: "1200-1500",
                        salaryExtendedWidget: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("in USD"),
                              SizedBox(height: 5),
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
                        hintText: "Yangon, Myanmar",
                        controller: controller.companyLocationC,
                        label: "Location",
                      ),
                      WithLabelTFField(
                        hintText: "Enter Your Company Name",
                        controller: controller.companyNameC,
                        label: "Name",
                      ),
                      WithLabelTFField(
                        hintText: "Enter Company Website",
                        controller: controller.companyWebsiteC,
                        label: "Website",
                      ),
                      WithLabelTFField(
                        hintText: "Enter Company Email",
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
                                "Fill in format below to generate bullet points.",
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
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
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
                              hintText:
                                  "require minium work exp of 2 years\nmust have positive attitude for work\nnew Requirement",
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
                                "Fill in format below to generate bullet points.",
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
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
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

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ElevatedButton(
                        //     onPressed: () => controller.printController(),
                        //     child: Text("Print")),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35))),
                              onPressed: () => controller.createJobPost(),
                              child: Obx(
                                () => controller.isLoading == true
                                    ? Container(
                                        height: 63,
                                        width: Get.width,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                              strokeWidth: 4,
                                            ),
                                            SizedBox(width: 30),
                                            Text(
                                              "Posting Your Job...  ",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ))
                                    : Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 20,
                                        ),
                                        child: Text(
                                          "Post",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                              )),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Expanded(
                        //   child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //           primary: Colors.black87),
                        //       onPressed: () => controller.clear(),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(vertical: 12.0),
                        //         child: Text(
                        //           "Clear",
                        //           style: TextStyle(fontSize: 16),
                        //         ),
                        //       )),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
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
          boxShadow: [kIconShadow],
          // borderRadius: BorderRadius.circular(20),

          color: themeBgMainColor),
      child: Theme(
        data: Theme.of(context).copyWith(
            // splashColor: Colors.transparent,
            dividerColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent),
        child: ExpansionTile(
          textColor: Colors.black87,
          iconColor: Colors.black87,
          collapsedTextColor: Colors.black54,
          collapsedIconColor: Colors.black54,
          backgroundColor: Colors.white,
          tilePadding: EdgeInsets.symmetric(horizontal: 10),
          leading: sectionIcon,
          title: Text(
            "$sectionTitle",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          children: children,
        ),
      ),
    );
  }
}

// class WithLabelTFField extends StatelessWidget {
//   final String label;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Widget? extendedWidget;
//   const WithLabelTFField({
//     Key? key,
//     this.controller,
//     this.hintText,
//     this.extendedWidget,
//     required this.label,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       // margin: EdgeInsets.symmetric(vertical: 5),
//       padding: EdgeInsets.symmetric(
//         horizontal: 15,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         // borderRadius: BorderRadius.circular(10),
//       ),
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               alignment: Alignment.centerLeft,
//               height: Get.height,
//               width: 120,
//               child: Text(
//                 label + " :",
//                 style: TextStyle(fontSize: 18, color: Colors.black),
//               )),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 5.0),
//               child: TextFormField(
//                 controller: controller,
//                 textAlignVertical: TextAlignVertical.center,
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: kPrimaryRedColor,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 decoration: InputDecoration(
//                   border: UnderlineInputBorder(),
//                   // focusedBorder: InputBorder.none,
//                   // enabledBorder: InputBorder.none,
//                   // errorBorder: InputBorder.none,
//                   // disabledBorder: InputBorder.none,
//                   filled: true,
//                   fillColor: Colors.transparent,
//                   hintText: hintText ?? label,
//                   hintStyle: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 18,
//                     color: Colors.black26,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           extendedWidget ?? SizedBox(),
//         ],
//       ),
//     );
//   }
// }

class WithLabelTFField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? salaryExtendedWidget;
  const WithLabelTFField({
    Key? key,
    this.controller,
    this.hintText,
    this.salaryExtendedWidget,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 7),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: TextFormField(
                keyboardType:
                    salaryExtendedWidget == null ? null : TextInputType.number,
                controller: controller,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black87),
                      borderRadius: BorderRadius.circular(15)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(15)),
                  // focusedBorder: InputBorder.none,
                  // enabledBorder: InputBorder.none,
                  // errorBorder: InputBorder.none,
                  // disabledBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText ?? "",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black26,
                  ),
                  labelText: label,
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          salaryExtendedWidget ?? SizedBox(),
        ],
      ),
    );
  }
}
