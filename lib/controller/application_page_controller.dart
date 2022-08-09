import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/storage.dart';

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
    currentStep = step;
  }

  continued() {
    currentStep < 3 ? currentStep += 1 : Get.back();
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

  RxBool isUploading = false.obs;
  RxString fileName = "".obs;
  Future<XFile?> pickCV() async {
    if (isUploading.value) return null;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      XFile _file = XFile(result.files.single.path!);
      fileName.value = _file.name;
      isUploading.value = false;
      return _file;
    } else {
      isUploading.value = false;
      return null;
    }
  }

  uploadCV() async {
    XFile? file = await pickCV();
    if (file != null) {
      // String fileLink =
      //     await storageService.uploadToFirebaseStorage(file, 'cv-form/test');
    }
  }

  RxList expansionOpen = [].obs;
}
