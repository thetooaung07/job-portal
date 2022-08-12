import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/services/database.dart';

class SearchPageController extends GetxController {
  RxString searchTitle = "".obs;

// Init data receiver
  List<JobPostModel> dataList = [];

// change according to query
  Rx<List<JobPostModel>> jobPostsList = Rx<List<JobPostModel>>([]);
  List<JobPostModel> get jobPosts => jobPostsList.value;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    dataList = await getJobPostsLists();
    jobPostsList.value = await getJobPostsLists();
  }

  Future<List<JobPostModel>> getJobPostsLists() async {
    QuerySnapshot<Map<String, dynamic>> doc =
        await FirestoreHelper().readByCollection(collectionPath: "jobPosts");

    List<JobPostModel> res =
        doc.docs.map((e) => JobPostModel.fromDocumentSnapshot(e)).toList();
    return res;
  }

  final TextEditingController textEditingController = TextEditingController();

// clear btn
  void clearText() {
    searchTitle.value = "";
    textEditingController.text = "";
    jobPostsList.value = dataList;
  }

// on changed when title is empty reassign init data to Rx<List>
  void getTitleFromSearchBar(String title) {
    searchTitle.value = title;
    update();

    jobPostsList.value = dataList.where((element) {
      final String jobCard = element.title.toLowerCase();
      final String input = title.toLowerCase();
      return jobCard.contains(input);
    }).toList();

    if (title == "") {
      jobPostsList.value = dataList;
    }
  }
}

/* Init => getAll => search page => 

  another List<d> 

 */
