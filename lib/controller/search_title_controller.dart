import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchTitleController extends GetxController {
  RxString searchTitle = "".obs;

  final TextEditingController searchPageController =
      new TextEditingController();

  void getTitleFromSearchBar(String title) {
    searchTitle.value = title;
    searchPageController.text = title;
    print(searchPageController.text);
    update();
  }
}
