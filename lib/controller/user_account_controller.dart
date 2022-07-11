import 'package:get/get.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/profile_stats.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';

class UserAccountController extends GetxController {
  Rx<UserAccount> _userAccount = UserAccount().obs;
  UserAccount get user => _userAccount.value;

  set user(UserAccount value) => this._userAccount.value = value;

  void clear() {
    _userAccount.value = UserAccount();
  }

  @override
  void onInit() {
    _userAccount.bindStream(
        FirestoreHelper().userAccountStream(firebaseAuth.currentUser!.uid));
    super.onInit();
  }

  int calculate(Map profileStats) {
    int count = 0;
    profileStats.forEach((key, value) {
      if (value == true) count++;
      return;
    });
    return count;
  }

// TODO try taking with stream
  Future updateProfileStats(
    String collectionPath,
    String docPath,
    Map<String, dynamic> data,
  ) async {
    // update partially
    await FirestoreHelper()
        .update(collectionPath: collectionPath, docPath: docPath, data: data);

    // calculate();
  }
}
