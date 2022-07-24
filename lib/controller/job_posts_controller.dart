import 'package:get/get.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/services/database.dart';

class JobPostsController extends GetxController {
  Rx<List<JobPostModel>> jobPostsList = Rx<List<JobPostModel>>([]);
  List<JobPostModel> get jobPosts => jobPostsList.value;

  @override
  void onReady() {
    FirestoreHelper().jobPostsStream().listen((event) {
      if (event.isNotEmpty)
        jobPostsList.bindStream(FirestoreHelper().jobPostsStream());
    });

    super.onReady();
  }
}
