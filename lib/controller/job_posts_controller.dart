import 'package:get/get.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';

class JobPostsController extends GetxController {
  Rx<List<JobPostModel>> jpList = Rx<List<JobPostModel>>([]);
  List<JobPostModel> get jobPosts => jpList.value;

  @override
  void onReady() {
    // TODO: implement onReady

    FirestoreHelper().jobPostsStream().listen((event) {
      if (event.isNotEmpty)
        jpList.bindStream(FirestoreHelper().jobPostsStream());
    });

    super.onReady();
  }
}
