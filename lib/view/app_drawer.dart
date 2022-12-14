import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

List<Map<String, dynamic>> drawerItems = [
  {
    "icon": Icons.settings,
    "title": "Notifications",
  },
  {
    "icon": Icons.shield_outlined,
    "title": "Privacy Policy",
  },
  {
    "icon": Icons.file_copy_outlined,
    "title": "Terms of Service",
  },
  {
    "icon": Icons.wysiwyg_rounded,
    "title": "About App",
  },
  {
    "icon": Icons.share_outlined,
    "title": "Share App",
  },
];

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.lightBlue,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thet Oo Aung",
                        style: kHeaderTextStyle.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Active Status",
                        style: kBodyTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 275,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: drawerItems.map((item) {
                    return Row(
                      children: [
                        Icon(
                          item["icon"],
                          size: 35,
                          color: const Color.fromARGB(180, 255, 255, 255),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          item["title"],
                          style: kLabelTextStyle.copyWith(
                              color: const Color.fromARGB(167, 255, 255, 255)),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: kLabelTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    height: 20,
                    width: 2,
                    color: Colors.white,
                  ),
                  Text(
                    "Log Out",
                    style: kLabelTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
