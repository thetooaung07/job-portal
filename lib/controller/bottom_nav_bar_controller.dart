import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/search_page_controller.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController(
    initialPage: 0,
  );

  void onPageChange(index) {
    if (index == 1) {
      Get.delete<SearchPageController>();
    }
    selectedIndex.value = index;

    // enable only after pageView is Successfully impl;
    // pageController.jumpToPage(index);
  }
}
