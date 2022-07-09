import 'package:get/get.dart';

class SavedJobsPageController extends GetxController {
  RxBool isFavourite = false.obs;
// TODO: Add jobs data to database and create a model
  // List<> favouriteJobs

  void addToFavourite() {
    print("isfavourite is working");
    // TODO: this below is toggle only/ Change code later
    isFavourite.value = !isFavourite.value;

    update(["favourite"]);
  }
}
