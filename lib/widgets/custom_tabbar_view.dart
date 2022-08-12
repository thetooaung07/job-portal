import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom3TabBarView extends StatelessWidget {
  final int tabIndex;
  final Widget firstTab;
  final Widget secondTab;
  final Widget thirdTab;

  const Custom3TabBarView({
    Key? key,
    required this.tabIndex,
    required this.firstTab,
    required this.secondTab,
    required this.thirdTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform:
              Matrix4.translationValues(tabIndex == 0 ? 0 : -Get.width, 0, 0),
          duration: const Duration(milliseconds: 175),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform: Matrix4.translationValues(
              tabIndex == 1
                  ? 0
                  : tabIndex == 2
                      ? -Get.width
                      : Get.width,
              0,
              0),
          duration: const Duration(milliseconds: 175),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: thirdTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform:
              Matrix4.translationValues(tabIndex == 2 ? 0 : Get.width, 0, 0),
          duration: const Duration(milliseconds: 175),
          curve: Curves.easeIn,
        )
      ],
    );
  }
}

class Custom2TabBarView extends StatelessWidget {
  final int tabIndex;
  final Widget firstTab;
  // final Widget secondTab;
  final Widget secondTab;

  const Custom2TabBarView({
    Key? key,
    required this.tabIndex,
    required this.firstTab,
    // required this.secondTab,
    required this.secondTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          child: firstTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform:
              Matrix4.translationValues(tabIndex == 0 ? 0 : -Get.width, 0, 0),
          duration: const Duration(milliseconds: 175),
          curve: Curves.easeIn,
        ),
        AnimatedContainer(
          child: secondTab,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          transform:
              Matrix4.translationValues(tabIndex == 1 ? 0 : Get.width, 0, 0),
          duration: const Duration(milliseconds: 175),
          curve: Curves.easeIn,
        )
      ],
    );
  }
}
