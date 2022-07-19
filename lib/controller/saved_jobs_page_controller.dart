import 'package:get/get.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';

class SavedJobsPageController extends GetxController {
  Rx<List<JobPostModel>> savedPosts = Rx<List<JobPostModel>>([]);

  List<JobPostModel> get getSavedPosts => savedPosts.value;
  set setSavedPosts(List<JobPostModel> value) => savedPosts.value = value;

  void addToFavourite(JobPostModel model) {
    getSavedPosts.add(model);
    update();
  }

  void removeFromFavourite(JobPostModel model) {
    List<JobPostModel> listData = [];
    getSavedPosts.forEach((element) {
      if (element.id != model.id)
        listData.add(element);
      else
        return;
    });

    savedPosts.value = listData;
    update();
  }

  bool checkAlreadySaved(String id) {
    JobPostModel? res =
        getSavedPosts.firstWhereOrNull((element) => element.id == id);
    if (res == null) {
      update();
      return false;
    } else {
      update();
      return true;
    }
  }
}
