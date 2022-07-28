import 'package:get/get.dart';

const List DropdownList = [
  "All",
  "Apply",
  "Shortlisted",
  "Interview",
];

class ApplicationsPageController extends GetxController {
  RxString _selectedVal = "${DropdownList[0]}".obs;
  get selectedVal => _selectedVal.value;

  RxList expansionOpen = [].obs;
}
