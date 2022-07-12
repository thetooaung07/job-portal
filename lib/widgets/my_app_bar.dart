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
    return SafeArea(
      child: AppBar(
        leadingWidth: 75,
        leading: leading ?? null,
        title: Text(
          label ?? "",
          style: kLogoTextStyle,
        ),
        actions: action ?? null,
        centerTitle: centerLabel,
        elevation: 0.75,
        backgroundColor: Colors.white,
      ),
    );
  }
}
