import 'package:get/get.dart';
import 'package:job_portal/controller/search_title_controller.dart';

class SearchPageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SearchTitleController());
  }
}
