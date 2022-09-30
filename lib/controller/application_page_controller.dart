// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';

class ApplicationsPageController extends GetxController {
  final RxInt _currentStep = 0.obs;
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
    if (stepperType.value == StepperType.vertical) {
      stepperType.value = StepperType.horizontal;
    } else if (stepperType.value == StepperType.horizontal) {
      stepperType.value = StepperType.vertical;
    }
  }

  bool checkShouldDisplayLabel(int index) {
    if (stepperType.value == StepperType.horizontal) {
      if (currentStep == index) {
        return true;
      }
      return false;
    } else {
      return true;
    }
  }

  RxBool isUploading = false.obs;
  RxString fileName = "".obs;
  RxString getFileLink = "".obs;
  Rx<XFile?> getFile = null.obs;

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
    } else {
      return null;
    }
  }

  RxBool isSelectedJobAlreadyApplied = false.obs;

  checkAlreadyApplied(String postId) async {
    myApplicationList2ForCheck.value = [];
    await getData();
    List<String> appliedJobPostId = [];
    for (var element in myApplicationList2ForCheck) {
      appliedJobPostId.add(element.jobPostId!);
    }
    isSelectedJobAlreadyApplied.value = appliedJobPostId.contains(postId);
  }

  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneNumberC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController summaryC = TextEditingController();
  TextEditingController techStackC = TextEditingController();
  TextEditingController workExpC = TextEditingController();
  TextEditingController slFacebookC = TextEditingController();
  TextEditingController slLinkedinC = TextEditingController();
  TextEditingController slGithubC = TextEditingController();
  TextEditingController slotherC = TextEditingController();
  TextEditingController questionC = TextEditingController();
  TextEditingController suggestionC = TextEditingController();
  RxString jobPostId = "".obs;

  void reset() {
    nameC.clear();
    emailC.clear();
    phoneNumberC.clear();
    addressC.clear();
    summaryC.clear();
    techStackC.clear();
    workExpC.clear();
    suggestionC.clear();
    questionC.clear();
    currentStep = 0;
  }

  @override
  void onInit() async {
    super.onInit();
    myInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   FirestoreHelper().userApplicantStream(selectedJobId.value).listen((event) {
  //     print(selectedJobId.value);
  //     if (event.isNotEmpty) {
  //       applicantsForSelectedJobPost.bindStream(
  //           FirestoreHelper().userApplicantStream(selectedJobId.value));
  //     }
  //   });

  //   funcFilter("All");
  // }

  // RxString selectedJobId = "".obs;
  void myInit() async {
    UserAccount user = Get.find<UserAccountController>().user;
    nameC.text = user.username!;
    emailC.text = user.email!;
    phoneNumberC.text = "09260177087";
    addressC.text = "Yangon, Myanmar";
    summaryC.text = "Energetic Person, etc\nPostitive Person\nBlah Blah";
    techStackC.text = "React, Nodejs, Flutter, Dart";
    workExpC.text = "2 Years of exp @ Starlight Studio";
    suggestionC.text = "Suggestions";
    questionC.text = "No Question";
  }

  applyJob() async {
    DocumentReference doc = firebaseFirestore.collection("applicants").doc();
    String documentID = doc.id;
    ApplicantModel data = ApplicantModel(
        id: documentID,
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
        socialLinks: {
          "facebook": slFacebookC.text,
          "linkedIn": slLinkedinC.text,
          "github": slGithubC.text,
          "other": slotherC.text
        },
        suggestion: suggestionC.text,
        question: questionC.text,
        applicationProcess: ApplicationProcess.applied);

    await FirestoreHelper().create(
        collectionPath: "applicants", docPath: documentID, data: data.toJson());

    Fluttertoast.showToast(msg: "Success", backgroundColor: Colors.green);
// TOADD Some Funcitonality to pre-check apply job before Get.back();
    isSelectedJobAlreadyApplied.value = true;

    Get.back();

    reset();
    myInit();
  }

  /// Get Applicant Data from firestore
  RxList<ApplicantModel> myApplicationList = <ApplicantModel>[].obs;
  RxList<ApplicantModel> myApplicationList2ForCheck = <ApplicantModel>[].obs;
  RxList<JobPostModel> appliedJobsList = <JobPostModel>[].obs;
  RxList<ApplicantModel> postedJobsList = <ApplicantModel>[].obs;

  getData() async {
    await firebaseFirestore
        .collection("applicants")
        .where("applicantId", isEqualTo: firebaseAuth.currentUser!.uid)
        .get()
        .then((data) => data.docs.forEach((element) {
              myApplicationList
                  .add(ApplicantModel.fromDocumentSnapshot(element));
              myApplicationList2ForCheck
                  .add(ApplicantModel.fromDocumentSnapshot(element));
            }));
  }

  getAppliedJobs() async {
    myApplicationList.value = [];
    appliedJobsList.value = [];
    await getData();

    if (myApplicationList.isNotEmpty) {
      for (var element in myApplicationList) {
        DocumentSnapshot<Map<String, dynamic>> res = await FirestoreHelper()
            .readByDoc(collectionPath: "jobPosts", docPath: element.jobPostId);
        appliedJobsList.add(JobPostModel.fromDocumentSnapshot(res));
      }
    }
  }

  // RxList<UserApplicantModel> applicantsForSelectedJobPost =
  //     <UserApplicantModel>[].obs;

  RxList<UserAccount> userApplicantList = <UserAccount>[].obs;

  // updateProcessStatus({
  //   required String toUpdate,
  //   required String docId,
  // }) async {
  //   await FirestoreHelper().update(
  //       collectionPath: "applicants",
  //       docPath: docId,
  //       data: {"applicationProcess": toUpdate}).then((value) => update());

  //   update();
  // }

  UserAccount getUserFromApplicantId(String applicantId) {
    late UserAccount user = UserAccount();
    if (userApplicantList.isNotEmpty) {
      user = userApplicantList.singleWhere((element) {
        return element.userId == applicantId;
      });
    }

    return user;
  }

  // RxList<UserApplicantModel> filterByProc = <UserApplicantModel>[].obs;

  // void funcFilter(String appProc) {
  //   if (appProc == "All") {
  //     filterByProc.value = applicantsForSelectedJobPost;
  //   } else {
  //     filterByProc.value = applicantsForSelectedJobPost
  //         .where((el) => el.applicant.applicationProcess == appProc)
  //         .toList();
  //   }
  // }
}
