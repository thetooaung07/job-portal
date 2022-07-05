import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  final Widget child;
  const MyAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        width: Get.width,
        height: MediaQuery.of(context).viewPadding.top + 60,
        decoration: BoxDecoration(color: Colors.transparent),
        child: child,
      ),
    );
  }
}
