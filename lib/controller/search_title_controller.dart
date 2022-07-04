import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchTitleController extends GetxController {
  RxString searchTitle = "".obs;

  final TextEditingController textEditingController =
      new TextEditingController();

  void clearText() {
    searchTitle.value = "";
    textEditingController.text = "";
  }

  void getTitleFromSearchBar(String title) {
    searchTitle.value = title;
    update();
  }
}
