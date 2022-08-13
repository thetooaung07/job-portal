import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            // Container(
            //   margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            //   child: CustomIconButton(
            //     onTap: () {
            //       Get.back();
            //       Get.find<BottomNavBarController>().selectedIndex.value = 1;
            //     },
            //     child: const Icon(
            //       Icons.search_rounded,
            //       size: 30,
            //       color: Colors.black,
            //     ),
            //   ),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                labelTextHor(
                  label: "Name",
                  body: user.username!,
                ),
                labelTextHor(
                  label: "Email",
                  body: user.email!,
                ),
                labelTextHor(
                  label: "Phone No",
                  body: applicant.phoneNumber!,
                )
              ],
            ),
          ),
        ));
  }
}

class labelTextHor extends StatelessWidget {
  final String label;
  final String body;
  const labelTextHor({Key? key, required this.label, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(width: 20, child: Text(":")),
          SizedBox(
            child: Text(
              body,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
