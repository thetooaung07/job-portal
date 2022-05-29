import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/bottom_navigation_bar/bottom_nav_bar_item.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';

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

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController _controller =
        Get.put(BottomNavBarController());

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navBarItem.map(
            (item) {
              return Expanded(
                child: BottomNavBarItem(
                  onPressed: () {
                    _controller.selectedIndex.value = item["id"];
                  },
                  id: item["id"],
                  label: item["label"],
                  icon: Icon(item["icon"]),
                  selectedIndex: _controller.selectedIndex.value,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
