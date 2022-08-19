import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final Widget? leading;
  final String? label;
  final bool? centerLabel;
  final List<Widget>? action;
  final Color? backgroundColor;
  final double? elevation;
  final double? leadingWidth;
  const MyAppBar(
      {Key? key,
      this.leading,
      this.label = "",
      this.centerLabel = true,
      this.action,
      this.backgroundColor,
      this.leadingWidth = 75,
      this.elevation = 0.75})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leadingWidth: leadingWidth ?? 75,
        leading: leading,
        title: label != null && label!.isNotEmpty
            ? Text(
                label!,
                style: kLogoTextStyle,
              )
            : null,
        actions: action,
        centerTitle: centerLabel,
        elevation: backgroundColor == Colors.transparent ? 0 : elevation,
        backgroundColor: backgroundColor ?? Colors.white,
      ),
    );
  }
}
