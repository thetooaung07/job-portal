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

    selectedJobId(selectedJobId.value);
    funcFilter("All");
  }

  RxString selectedJobId = "".obs;
  streamInit(String inputJobId) {
    applicantsForSelectedJobPost.clear();
    FirestoreHelper().userApplicantStream(inputJobId).listen((event) {
      if (event.isNotEmpty) {
        applicantsForSelectedJobPost
            .bindStream(FirestoreHelper().userApplicantStream(inputJobId));
      }
    });
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
