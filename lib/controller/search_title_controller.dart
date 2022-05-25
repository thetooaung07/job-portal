import 'package:get/get.dart';

class SearchTitleController extends GetxController {
  RxString searchTitle = "".obs;

  void getTitleFromSearchBar(String title) {
    searchTitle.value = title;
    print(searchTitle.value);
    update();
  }
}
