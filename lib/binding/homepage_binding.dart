import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    print("Controller is put");
    Get.lazyPut(() => BottomNavBarController());
  }
}
