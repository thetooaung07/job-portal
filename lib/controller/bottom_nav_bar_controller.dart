import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();
  void onPageChange(value) {
    selectedIndex.value = value;

    pageController.jumpToPage(selectedIndex.value);
    //   switch (selectedIndex.value) {
    //     case 1:
    //       Get.toNamed(RouteNames.home);
    //       break;
    //     case 2:
    //       Get.toNamed(RouteNames.jobs);
    //       break;
    //     case 3:
    //       Get.toNamed(RouteNames.notifications);
    //       break;
    //     case 4:
    //       Get.toNamed(RouteNames.profile);
    //       break;
    //   }
  }
}
