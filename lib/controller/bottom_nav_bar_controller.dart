import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 2.obs;
  final PageController pageController = PageController(
    initialPage: 2,
  );

  void onPageChange(index) {
    selectedIndex.value = index;
    // enable only after pageView is Successfully impl;
    // pageController.jumpToPage(index);
  }
}
