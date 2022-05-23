import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class ShowAllTextBanner extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const ShowAllTextBanner({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit * 2, vertical: kSpacingUnit * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: kHeaderTextStyle,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text("See All"),
          ),
        ],
      ),
    );
  }
}
