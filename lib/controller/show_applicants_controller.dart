import 'package:get/get.dart';
import 'package:job_portal/model/user_applicant_model.dart';
import 'package:job_portal/services/database.dart';

const List dropdownList = <String>[
  "All",
  "Applied",
  "Shortlisted",
  "Interview",
  "Rejected"
];

class ShowApplicantsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    FirestoreHelper().userApplicantStream(selectedJobId.value).listen((event) {
      print(selectedJobId.value);
      if (event.isNotEmpty) {
        applicantsForSelectedJobPost.bindStream(
            FirestoreHelper().userApplicantStream(selectedJobId.value));
      }
    });
    funcFilter("All");
  }

  @override
  void onInit() {
    super.onInit();
  }

  final RxString _selectedVal = "${dropdownList[0]}".obs;
  String get selectedVal => _selectedVal.value;
  set selectedVal(String v) => _selectedVal.value = v;

  RxList<UserApplicantModel> applicantsForSelectedJobPost =
      <UserApplicantModel>[].obs;

  void funcFilter(String appProc) {
    if (appProc == "All") {
      filterByProc.value = applicantsForSelectedJobPost;
    } else {
      filterByProc.value = applicantsForSelectedJobPost
          .where((el) => el.applicant.applicationProcess == appProc)
          .toList();
    }
  }

  RxString selectedJobId = "".obs;
  RxList<UserApplicantModel> filterByProc = <UserApplicantModel>[].obs;

  updateProcessStatus({
    required String toUpdate,
    required String docId,
  }) async {
    await FirestoreHelper().update(
        collectionPath: "applicants",
        docPath: docId,
        data: {"applicationProcess": toUpdate}).then((value) => update());

    update();
  }
}
