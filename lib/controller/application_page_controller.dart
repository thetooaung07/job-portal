import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/services/database.dart';
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

  continued() async {
    currentStep < 3 ? currentStep += 1 : await applyJob();
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
  RxString getFileLink = "".obs;
  Rx<XFile?> getFile = XFile("").obs;

  void pickCV() async {
    if (isUploading.value) return null;
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      XFile _file = XFile(result.files.single.path!);
      fileName.value = _file.name;
      isUploading.value = false;
      getFile.value = _file;
    } else {
      isUploading.value = false;
      getFile.value = null;
    }
  }

  Future<String?> uploadCV() async {
    XFile? file = getFile.value;
    if (file != null) {
      String fileLink = await storageService.uploadToFirebaseStorage(
          file, 'cv-form/${file.name}');
      getFileLink.value = fileLink;
      return fileLink;
    } else
      return null;
  }

  bool isSelectedJobAlreadyApplied(String postId) {
    List<String> appliedJobPostId = [];

    myApplicationList.forEach((element) {
      appliedJobPostId.add(element.jobPostId!);
    });

    return appliedJobPostId.contains(postId);
  }

  TextEditingController nameC = new TextEditingController();
  TextEditingController emailC = new TextEditingController();
  TextEditingController phoneNumberC = new TextEditingController();
  TextEditingController addressC = new TextEditingController();
  TextEditingController summaryC = new TextEditingController();
  TextEditingController techStackC = new TextEditingController();
  TextEditingController workExpC = new TextEditingController();
  TextEditingController slFacebookC = new TextEditingController();
  TextEditingController slLinkedinC = new TextEditingController();
  TextEditingController slGithubC = new TextEditingController();
  TextEditingController slotherC = new TextEditingController();
  TextEditingController questionC = new TextEditingController();
  TextEditingController suggestionC = new TextEditingController();
  RxString jobPostId = "".obs;

  @override
  void onInit() async {
    super.onInit();
    UserAccount user = Get.find<UserAccountController>().user;
    nameC.text = user.username!;
    emailC.text = user.email!;
    phoneNumberC.text = "09260177087";
    addressC.text = "Yangon, Myanmar";
    summaryC.text = "Energetic Person, etc\nPostitive Person\nBlah Blah";
    techStackC.text = "React, Nodejs, Flutter, Dart";
    workExpC.text = "Min 2 Years of experience @ CodeLab";
    suggestionC.text = "Suggestions";
    questionC.text = "No Question";

    await getData();
    await getJobPostOwner();
    // print(myApplicationList.length);
  }

  printController() {
    print("Controller => ${getFileLink.value}");
  }

  applyJob() async {
    ApplicantModel data = ApplicantModel(
      jobPostId: jobPostId.value,
      applicantId: firebaseAuth.currentUser!.uid,
      applicantName: nameC.text,
      email: emailC.text,
      phoneNumber: phoneNumberC.text,
      address: addressC.text,
      summary: summaryC.text,
      cvForm: await uploadCV(),
      techStacks: techStackC.text,
      workExp: workExpC.text,
      socialLinks: <String>[
        slFacebookC.text,
        slLinkedinC.text,
        slGithubC.text,
        slotherC.text
      ],
      suggestion: suggestionC.text,
      question: questionC.text,
    );
    await FirestoreHelper()
        .create(collectionPath: "applicants", data: data.toJson());

    Fluttertoast.showToast(msg: "Success", backgroundColor: Colors.green);
    Get.back();
  }

  /// Get Applicant Data from firestore
  RxList<ApplicantModel> myApplicationList = <ApplicantModel>[].obs;
  RxList<JobPostModel> jobPostList = <JobPostModel>[].obs;
  RxList<String> jobPostOwnerList = <String>[].obs;

  getData() async {
    await firebaseFirestore
        .collection("applicants")
        .where("applicantId", isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((data) => data.docs.forEach((element) {
              myApplicationList
                  .add(ApplicantModel.fromDocumentSnapshot(element));
            }));
  }

  getJobPostOwner() async {
    if (myApplicationList.length > 0) {
      // print("Inside > 0, lenght => ${myApplicationList.length} ");
      myApplicationList.forEach((element) async {
        // print("element => ${element.jobPostId}");
        DocumentSnapshot<Map<String, dynamic>> res = await FirestoreHelper()
            .readByDoc(collectionPath: "jobPosts", docPath: element.jobPostId);
        jobPostList.add(JobPostModel.fromDocumentSnapshot(res));
      });
    }
  }

  RxList expansionOpen = [].obs;
}
