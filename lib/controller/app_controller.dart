import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/services/database.dart';

class AppController extends GetxController {
//   late StreamSubscription authStateChanges;
//   StreamSubscription? userChanges;
//   Rx<User?> _user = null.obs;

//   User? get user => _user.value;

// // Check Login or Not
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     authStateChanges = authService.authStateChanges().listen((event) {
//       if (event != null) {
//         userChanges = authService.userChanges().listen((event) {});
//       } else {
//         userChanges?.cancel();
//       }
//     });
//   }

  // RxList<JobPostModel> jobPostList = <JobPostModel>[].obs;

  // List<JobPostModel> get jobPosts => jobPostList.value;

  // Rx<List<JobPostModel>> jpList = Rx<List<JobPostModel>>([]);
  // List<JobPostModel> get jobPosts => jpList.value;

  // @override
  // void onInit() {
  //   // TODO: implement onInit

  //   super.onInit();
  //   jpList.bindStream(FirestoreHelper().jobPostsStream());
  // }
}
