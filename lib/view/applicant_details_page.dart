import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class ApplicantDetailsPage extends StatelessWidget {
  const ApplicantDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccount user = Get.arguments[0] as UserAccount;
    ApplicantModel applicant = Get.arguments[1] as ApplicantModel;

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
          label: "Details",
          action: const [
            //  Container(
            //     margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //     alignment: Alignment.center,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.teal,
            //     ),
            //     child: Text(
            //       applicant.applicationProcess!,
            //       style: const TextStyle(color: Colors.white),
            //     )),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Container(
                        height: 125,
                        width: 125,
                        alignment: Alignment.center,
                        child: user.profile != null
                            ? Image.network(user.profile!)
                            : Image.asset('assets/images/default.png')),
                    const SizedBox(
                      height: 20,
                    ),
                    LabelTextHor(
                      label: "Name",
                      body: user.username!,
                    ),
                    LabelTextHor(
                      label: "Email",
                      body: user.email!,
                    ),
                    LabelTextHor(
                      label: "Phone No",
                      body: applicant.phoneNumber!,
                    ),
                    LabelTextHor(
                      label: "Address",
                      body: applicant.address!,
                    ),
                    LabelTextHor(
                      label: "Tech Stack",
                      body: applicant.techStacks!,
                    ),
                    LabelTextHor(
                      label: "Work Exp",
                      body: applicant.workExp!,
                    ),
                    LabelTextHor(
                      label: "Summary",
                      body: applicant.summary!,
                    ),
                    LabelTextHor(
                      label: "Connect",
                      data: applicant.socialLinks,
                    ),
                    LabelTextHor(
                      label: "Suggestion",
                      body: applicant.suggestion!,
                    ),
                    LabelTextHor(
                      label: "Question",
                      body: applicant.question!,
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    decoration: BoxDecoration(
                        color: applicationProcessMatchColor(
                            applicant.applicationProcess ??
                                ApplicationProcess.unknown),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      applicant.applicationProcess ??
                          ApplicationProcess.unknown,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          shadows: [kIconShadow]),
                    ),
                  ))
            ],
          ),
        ));
  }
}

// socialLinks/suggestion / question
class LabelTextHor extends StatelessWidget {
  final String label;
  final String? body;
  final Map? data;
  const LabelTextHor({Key? key, required this.label, this.body, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment:
            data != null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 20, child: Text(":")),
          data != null && data!.isNotEmpty
              ? SizedBox(
                  height: 45,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      // String key = data!.keys.elementAt(index);

                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(223, 216, 216, 216)),
                        child: const Icon(Icons.facebook),
                      );
                    },
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: Text(
              body ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget generateSocialIcon(Map data) {
// data.map((key, value) {
//    if(key == "facebook")
// })

//   return
// }
