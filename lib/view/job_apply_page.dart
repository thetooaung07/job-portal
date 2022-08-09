import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/application_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class JobApplyPage extends StatelessWidget {
  const JobApplyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationsPageController controller =
        Get.put(ApplicationsPageController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.changeStepperType,
        child: Icon(Icons.replay_circle_filled_rounded),
      ),
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
        label: "Apply Now",
        action: [
          // Container(
          //   margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
          //   child: CustomIconButton(
          //     onTap: () {
          //       Get.back();
          //       Get.find<BottomNavBarController>().selectedIndex.value = 1;
          //     },
          //     child: Icon(
          //       Icons.search_rounded,
          //       size: 30,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Stepper(
                controlsBuilder: (context, details) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: details.onStepCancel,
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 15),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(elevation: 0),
                          onPressed: details.onStepContinue,
                          child: Text(
                            "Continue",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  );
                },
                elevation: 0,
                physics: controller.stepperType.value == StepperType.horizontal
                    ? NeverScrollableScrollPhysics()
                    : ScrollPhysics(),
                currentStep: controller.currentStep,
                onStepTapped: (step) => controller.tapped(step),
                onStepContinue: controller.continued,
                onStepCancel: controller.cancel,
                type: controller.stepperType.value,
                steps: [...buildSteps(controller)],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Build Steps Function
  List<Step> buildSteps(ApplicationsPageController controller) {
    return [
      Step(
        title: RichText(
            text: TextSpan(
                text: controller.checkShouldDisplayLabel(0)
                    ? "Your Profile"
                    : null,
                style: TextStyle(color: Colors.black))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(
              height: 20,
            ),
            // Text(
            //   "Summery",
            //   style: TextStyle(fontSize: 15),
            // ),
            TFField(
              labelText: "Summery",
            ),
          ],
        ),
        isActive: controller.currentStep >= 0,
        state: controller.currentStep >= 0
            ? StepState.complete
            : StepState.disabled,
      ),
      Step(
        title: RichText(
            text: TextSpan(
                text: controller.checkShouldDisplayLabel(1)
                    ? "Skills Experience"
                    : null,
                style: TextStyle(color: Colors.black))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Tech Stacks You Use'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Work Experience'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        isActive: controller.currentStep >= 0,
        state: controller.currentStep >= 1
            ? StepState.complete
            : StepState.disabled,
      ),
      Step(
        title: RichText(
            text: TextSpan(
                text: controller.checkShouldDisplayLabel(2)
                    ? "Your CV & Socials"
                    : null,
                style: TextStyle(color: Colors.black))),
        content: Container(
          height: controller.stepperType.value == StepperType.horizontal
              ? Get.height
              : null,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.text_snippet_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "CV Form ",
                      style: kBodyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: controller.fileName != ""
                          ? Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    controller.fileName.value,
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
                                  IconButton(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.clear_rounded,
                                      ),
                                      onPressed: () {
                                        controller..fileName.value = "";
                                      })
                                ],
                              ),
                            )
                          : GestureDetector(
                              onTap: controller.pickCV,
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(161, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text(
                                  "Upload CV",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
              ExpansionTile(
                initiallyExpanded: false,
                title: Row(
                  children: [
                    Text("Provide Socials Links"),
                  ],
                ),
                children: [
                  SocialLinkTField(
                    icon: Icon(Icons.facebook_rounded),
                    hintText: "Provide Link for facebook",
                  ),
                  SocialLinkTField(
                    icon: Icon(Icons.text_snippet_rounded),
                    hintText: "Provide Link for Github",
                  ),
                  SocialLinkTField(
                    icon: Icon(Icons.linked_camera),
                    hintText: "Provide Link for Linkedin",
                  ),
                  SocialLinkTField(
                    icon: Icon(Icons.other_houses_outlined),
                    hintText: "Link for other Resources",
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        isActive: controller.currentStep >= 0,
        state: controller.currentStep >= 2
            ? StepState.complete
            : StepState.disabled,
      ),
      Step(
        title: RichText(
            text: TextSpan(
                text:
                    controller.checkShouldDisplayLabel(3) ? "Questions" : null,
                style: TextStyle(color: Colors.black))),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Any Questions you want to ask us?",
              style: TextStyle(fontSize: 15),
            ),
            TFField(),
            Text(
              "Any Suggestions you want to give us?",
              style: TextStyle(fontSize: 15),
            ),
            TFField(),
          ],
        ),
        isActive: controller.currentStep >= 0,
        state: controller.currentStep >= 3
            ? StepState.complete
            : StepState.disabled,
      ),
    ];
  }
}

class SocialLinkTField extends StatelessWidget {
  final Icon? icon;
  final String? hintText;
  const SocialLinkTField({Key? key, this.icon, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: icon ?? Icon(Icons.insert_chart_outlined_rounded),
          ),
          Container(
            width: 1,
            height: Get.height,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 11),
                    hintText: hintText ?? "Provide Your Link for Facebook",
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TFField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  const TFField({
    this.labelText,
    this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      height: 30 * 4.5,
      child: TextField(
        style: TextStyle(
          fontSize: 17,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 4,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            labelText: labelText ?? null,
            alignLabelWithHint: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black45),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.transparent),
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
            fillColor: Colors.white,
            filled: true),
      ),
    );
  }
}
