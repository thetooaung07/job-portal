import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 3.obs;
  final PageController pageController = PageController(
    initialPage: 3,
  );

  void onPageChange(index) {
    selectedIndex.value = index;

    pageController.jumpToPage(index);
  }
}
