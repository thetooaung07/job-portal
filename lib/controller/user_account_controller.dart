import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/services/database.dart';

class UserAccountController extends GetxController {
  Rx<UserAccount> _userAccount = UserAccount().obs;
  UserAccount get user => _userAccount.value;

  set user(UserAccount value) => this._userAccount.value = value;

  void clear() {
    _userAccount.value = UserAccount();
  }

// profile_stats

  RxMap profileStats = {}.obs;

  Future getProfileStats(String docId) async {
    DocumentSnapshot doc = await FirestoreHelper()
        .readByDoc(collectionPath: "profile_stats", docPath: docId);

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    profileStats.value = data;
  }

  Future updateProfileStats(
    String collectionPath,
    String docPath,
    Map<String, dynamic> data,
  ) async {
    // update partially
    await FirestoreHelper()
        .update(collectionPath: collectionPath, docPath: docPath, data: data);
  }
}
