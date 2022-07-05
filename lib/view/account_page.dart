import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/job-post-card-hr.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 35,
                        width: 25,
                      ),
                      Text(
                        "Profile",
                        style: kLogoTextStyle,
                      ),
                      CustomIconButton(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Thet Oo Aung",
                    style: kHeaderTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "React Developer || Flutter Beginner",
                    style: kBulletListTextStyle.copyWith(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            //TODO: To Change Custom to look more beautiful // indicator indside Square
            //  Complete Your Profile
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Complete Your Profile (1/4)"),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: themeBgColor,
                      value: 0.3,
                      minHeight: 12,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 200,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => ProfileCardHr(),
              ),
            ),

            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(Icons.settings),
              title: Text("Setting"),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(
                Icons.message_rounded,
                size: 25,
              ),
              title: Text("Help & Feedback"),
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCardHr extends StatelessWidget {
  const ProfileCardHr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 20, right: 20),
      width: 150,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(19, 83, 83, 83),
            blurRadius: 8,
            offset: Offset(2, -1),
            spreadRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.person_rounded,
                size: 35,
              ),
              Text(
                "Set Your Profile Details",
                textAlign: TextAlign.center,
                style: kBodyTextStyle,
              ),
              CustomTextButton(
                label: "Complete",
              ),
            ]),
      ),
    );
  }
}
