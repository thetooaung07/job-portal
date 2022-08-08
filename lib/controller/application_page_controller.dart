import 'package:flutter/material.dart';
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

  RxInt _currentStep = 0.obs;
  int get currentStep => _currentStep.value;
  set currentStep(int v) => _currentStep.value = v;

  Rx<StepperType> stepperType = StepperType.vertical.obs;

  tapped(int step) {
    print("step => $step");
    currentStep = step;
  }

  continued() {
    print("Inside Continue => $currentStep");
    currentStep < 3 ? currentStep += 1 : null;
  }

  cancel() {
    currentStep > 0 ? currentStep -= 1 : null;
  }

  changeStepperType() {
    if (stepperType == StepperType.vertical) {
      stepperType.value = StepperType.horizontal;
    } else if (stepperType == StepperType.horizontal) {
      stepperType.value = StepperType.vertical;
    }
  }

  bool checkShouldDisplayLabel(int index) {
    if (stepperType == StepperType.horizontal) {
      if (currentStep == index) {
        return true;
      }
      return false;
    } else
      return true;
  }

  RxList expansionOpen = [].obs;
}
