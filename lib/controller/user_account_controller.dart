import 'package:get/get.dart';
import 'package:job_portal/model/user_account.dart';

class UserAccountController extends GetxController {
  Rx<UserAccount> _userAccount = UserAccount().obs;
  UserAccount get user => _userAccount.value;

  set user(UserAccount value) => this._userAccount.value = value;

  void clear() {
    _userAccount.value = UserAccount();
  }
}
