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
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Stepper(
                elevation: 0,
                physics: ScrollPhysics(),
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
            TextFormField(
              decoration: InputDecoration(labelText: 'Summery'),
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
        content: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Icon(Icons.text_snippet_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "CV Form ",
                  style: kBodyTextStyle.copyWith(
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: Icon(Icons.facebook),
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Provide Your Link for Facebook",
                    border: InputBorder.none),
              ),
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: Icon(Icons.text_snippet_rounded),
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Provide Your Link for Github",
                    border: InputBorder.none),
              ),
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: Icon(Icons.linked_camera),
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Provide Your Link for Linkedin",
                    border: InputBorder.none),
              ),
            ),
            ListTile(
              minLeadingWidth: 10,
              leading: Icon(Icons.other_houses_outlined),
              title: TextField(
                decoration: InputDecoration(
                    hintText: "Link for other Resources",
                    border: InputBorder.none),
              ),
            ),
          ],
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
        state: controller.currentStep >= 0
            ? StepState.complete
            : StepState.disabled,
      ),
    ];
  }
}

class TFField extends StatelessWidget {
  const TFField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      height: 30 * 4.2,
      child: TextField(
        style: TextStyle(
          fontSize: 17,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 4,
        decoration: InputDecoration(
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
