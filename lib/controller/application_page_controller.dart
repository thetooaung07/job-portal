import 'package:get/get.dart';

const List DropdownList = <String>[
  "All",
  "Apply",
  "Shortlisted",
  "Interview",
];

class ApplicationsPageController extends GetxController {
  RxString _selectedVal = "${DropdownList[0]}".obs;
  String get selectedVal => _selectedVal.value;
  set selectedVal(String v) => _selectedVal.value = v;

  RxList expansionOpen = [].obs;
}
