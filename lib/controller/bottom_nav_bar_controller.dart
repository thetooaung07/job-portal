import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChange(index) {
    selectedIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
