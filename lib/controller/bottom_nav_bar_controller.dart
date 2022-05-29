import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 1.obs;
  void onPageChange(value) {
    selectedIndex.value = value;
  }
}
