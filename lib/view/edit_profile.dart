import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserAccountController controller = Get.find<UserAccountController>();

  @override
  void initState() {
    super.initState();

    if (controller.user.username != null && controller.user.email != null) {
      controller.usernameC.text = controller.user.username!;
      controller.emailC.text = controller.user.email!;
    }
  }

  @override
  void dispose() {
    controller.usernameC..dispose();
    controller.emailC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
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
        label: "Jobs",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: (() => {}),
              child: Icon(
                Icons.more_vert_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LabelTextField(
                label: "Username",
                hintText: "Change Username",
                controller: controller.usernameC,
              ),
              LabelTextField(
                label: "Mail",
                hintText: "Change Email",
                controller: controller.emailC,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: Container(
                      width: Get.width / 4,
                      alignment: Alignment.center,
                      child: Text(
                        "Update",
                        style: kLabelTextStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      )),
                  onPressed: () {
                    controller.usernameAndEmailUpdate();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LabelTextField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;

  const LabelTextField({Key? key, this.label, this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: Text(
            label ?? "",
            style: kLabelTextStyle.copyWith(
                fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller ?? null,
            autofocus: false,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                prefixIcon: null,
                suffixIcon: null,
                contentPadding: EdgeInsets.all(20),
                hintText: hintText ?? "",
                hintStyle: TextStyle(
                  color: Color.fromARGB(111, 0, 0, 0),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )

                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //       color: Colors.white,
                //       width: 1,
                //     )),

                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide(
                //       color: Colors.white,
                //       width: 1,
                //     )),
                // errorBorder: InputBorder.none,
                // disabledBorder: InputBorder.none,
                ),
          ),
        ),
      ],
    );
  }
}
