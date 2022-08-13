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

const List dropdownList = <String>[
  "All",
  "Apply",
  "Shortlisted",
  "Interview",
];

class ApplicationsPageController extends GetxController {
  final RxString _selectedVal = "${dropdownList[0]}".obs;
  String get selectedVal => _selectedVal.value;
  set selectedVal(String v) => _selectedVal.value = v;

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
    } else {
      return null;
    }
  }

  bool isSelectedJobAlreadyApplied(String postId) {
    List<String> appliedJobPostId = [];

    for (var element in myApplicationList) {
      appliedJobPostId.add(element.jobPostId!);
    }

    return appliedJobPostId.contains(postId);
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
    await getAppliedJobs();
  }

  // printController() {`
  //   print("Controller => ${getFileLink.value}");
  // }

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
        applicationProcess: ApplicationProcess.applied);
    await FirestoreHelper()
        .create(collectionPath: "applicants", data: data.toJson());

    Fluttertoast.showToast(msg: "Success", backgroundColor: Colors.green);
    Get.back();
  }

  /// Get Applicant Data from firestore
  RxList<ApplicantModel> myApplicationList = <ApplicantModel>[].obs;
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
            }));
  }

  getAppliedJobs() async {
    if (myApplicationList.isNotEmpty) {
      // print("Inside > 0, lenght => ${myApplicationList.length} ");
      for (var element in myApplicationList) {
        DocumentSnapshot<Map<String, dynamic>> res = await FirestoreHelper()
            .readByDoc(collectionPath: "jobPosts", docPath: element.jobPostId);
        appliedJobsList.add(JobPostModel.fromDocumentSnapshot(res));
      }
    }
  }

  RxList<ApplicantModel> applicantsForSelectedJobPost = <ApplicantModel>[].obs;

  RxList<UserAccount> applicantList = <UserAccount>[].obs;

  getApplicantsFromPostedJobPosts(String selectedJobId) async {
    applicantsForSelectedJobPost.clear();
    applicantList.clear();
    await firebaseFirestore
        .collection("applicants")
        .where("jobPostId", isEqualTo: selectedJobId)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) async {
              applicantsForSelectedJobPost
                  .add(ApplicantModel.fromDocumentSnapshot(element));

              String userId =
                  ApplicantModel.fromDocumentSnapshot(element).applicantId!;

              await firebaseFirestore
                  .collection("users")
                  .doc(userId)
                  .get()
                  .then((value) {
                return applicantList
                    .add(UserAccount.fromDocumentSnapshot(value));
              });
            },
          ),
        );
  }
}
