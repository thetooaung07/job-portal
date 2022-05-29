import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';

class BottomNavBarItem extends StatelessWidget {
  final String label;
  final Icon icon;
  final int id;
  final int selectedIndex;
  final Function() onPressed;

  const BottomNavBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.id,
      required this.selectedIndex,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController _controller = Get.find();

    print("${_controller.selectedIndex.value}");

    return Obx(
      () => InkWell(
        onTap: onPressed,
        child: Container(
          // width: (Get.width - 80) / 4,
          decoration: BoxDecoration(
              color: _controller.selectedIndex.value == id
                  ? Colors.teal
                  : Colors.transparent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                label,
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
