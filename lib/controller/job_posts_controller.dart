import 'package:get/get.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/services/database.dart';

class JobPostsController extends GetxController {
  // for all job posts
  Rx<List<JobPostModel>> jobPostsList = Rx<List<JobPostModel>>([]);
  List<JobPostModel> get jobPosts => jobPostsList.value;

  @override
  void onReady() {
    FirestoreHelper().jobPostsStream().listen((event) {
      if (event.isNotEmpty) {
        jobPostsList.bindStream(FirestoreHelper().jobPostsStream());
      }

      userJobPostsList.bindStream(FirestoreHelper().jobPostsByOneUser());
    });

    super.onReady();
  }

  // job posts by login user or specific user
  Rx<List<JobPostModel>> userJobPostsList = Rx<List<JobPostModel>>([]);
  List<JobPostModel> get userJobPosts => userJobPostsList.value;
}
