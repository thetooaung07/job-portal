import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/services/auth_service.dart';
import 'package:job_portal/services/storage.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

final loginUserID = firebaseAuth.currentUser?.uid;

final AuthService authService = AuthService();
final StorageService storageService = StorageService();
final ImagePicker imagePicker = ImagePicker();

// void customPrint(dynamic title, dynamic res) {
//   print(" $title => ${res}");
// }

List<String> greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return ["🌄", " Good Morning"];
  }
  if (hour < 17) {
    return ["☀️", "Good Afternoon"];
  }
  return ["🌃", "Good Evening"];
}

String differenceInString(DateTime time) {
  Duration res = DateTime.now().difference(time);

  return res.inDays > 365
      ? "${res.inDays ~/ 365}y"
      : res.inDays > 7
          ? "${res.inDays ~/ 7}w"
          : res.inDays > 1
              ? "${res.inDays}d"
              : res.inHours > 1
                  ? "${res.inHours}h"
                  : "${res.inMinutes}m";
}
