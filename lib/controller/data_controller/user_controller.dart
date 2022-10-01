import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:job_portal/model/user_model.dart';

class UserController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();

    print("UserController is initialized");
    // addUser();
    getUser();
  }

  /* Add User */
  Future addUser() async {
    DocumentReference doc = _firebaseFirestore.collection("test_users").doc();
    String documentID = doc.id;
    UserInfoModel userInfo = UserInfoModel(
        username: "username",
        email: "email",
        password: "password",
        userId: documentID);

    UserJobProfileModel userJobProfile = UserJobProfileModel();

    UserModel user = UserModel(
        userInfoModel: userInfo,
        appliedJobIds: [
          "appliedJobIds",
          "appliedJobIds",
        ],
        postedJobIds: ["postedJobIds", "postedJobIds"],
        userJobProfileModel: userJobProfile);

    await _firebaseFirestore
        .collection("test_users")
        .doc(documentID)
        .set(user.toJson());
  }

  /* Get User */

  void getUser() async {
    DocumentSnapshot doc = await _firebaseFirestore
        .collection("test_users")

        // ! TODO change to dynamic
        .doc("RRwuafoiHWx3pCTJhdr4")
        .get();

    print(UserModel.fromDocumentSnapshot(doc));
  }
}
