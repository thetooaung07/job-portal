import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final Widget? leading;
  final String? label;
  final bool? centerLabel;
  final List<Widget>? action;
  const MyAppBar(
      {Key? key,
      this.leading,
      this.label = "",
      this.centerLabel = true,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 75,
      leading: leading ?? null,
      title: Text(
        label ?? "",
        style: kLogoTextStyle,
      ),
      actions: action ?? null,
      centerTitle: centerLabel,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
// return SafeArea(
    //   child: Container(
    //     // padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
    //     width: Get.width,
    //     height: MediaQuery.of(context).viewPadding.top + 60,
    //     decoration: BoxDecoration(color: Colors.transparent),
    //     child: child,
    //   ),
    // );