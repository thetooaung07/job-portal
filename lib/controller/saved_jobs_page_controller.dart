import 'package:get/get.dart';
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
    for (var element in getSavedPosts) {
      if (element.id != model.id) {
        listData.add(element);
      } else {
        continue;
      }
    }

    savedPosts.value = listData;
    update();
  }

  bool checkAlreadySaved(String id) {
    JobPostModel? res =
        getSavedPosts.firstWhereOrNull((element) => element.id == id);
    if (res == null) {
      return false;
    } else {
      return true;
    }
  }
}
