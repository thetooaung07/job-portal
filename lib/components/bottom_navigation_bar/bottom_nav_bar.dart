import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/bottom_navigation_bar/bottom_nav_bar_item.dart';

List<Map<String, dynamic>> navBarItem = [
  {
    "id": 1,
    "icon": Icons.home_rounded,
    "label": "Home",
  },
  {
    "id": 2,
    "icon": Icons.work_rounded,
    "label": "Jobs",
  },
  {
    "id": 3,
    "icon": Icons.notifications_rounded,
    "label": "Notifications",
  },
  {
    "id": 4,
    "icon": Icons.person_rounded,
    "label": "Profile",
  },
];

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navBarItem.map(
          (item) {
            return BottomNavBarItem(
              onPressed: () => setState(() {
                _selectedIndex = item["id"];
              }),
              id: item["id"],
              label: item["label"],
              icon: Icon(item["icon"]),
              selectedIndex: _selectedIndex,
            );
          },
        ).toList(),
      ),
    );
  }
}
