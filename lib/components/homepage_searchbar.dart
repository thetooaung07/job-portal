import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.search);
      },
      child: Container(
        height: kSpacingUnit * 5,
        decoration: BoxDecoration(
          color: kSilverColor,
          borderRadius: BorderRadius.circular(kSpacingUnit * 4),
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: kSpacingUnit * 2),
              SvgPicture.asset(
                'assets/icons/search.svg',
                height: 15,
                width: 15,
              ),
              SizedBox(width: kSpacingUnit),
              Text(
                'Search for jobs',
                style: kBodyTextStyle.copyWith(
                  color: kSecondaryTextColor,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/slider_icon.svg',
                height: 15,
                width: 15,
              ),
              SizedBox(width: kSpacingUnit * 3),
            ],
          ),
        ),
      ),
    );
  }
}
