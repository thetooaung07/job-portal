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

void customPrint(dynamic title, dynamic res) {
  print(" $title => ${res}");
}

String differenceInString(DateTime time) {
  return DateTime.now().difference(time).inDays > 365
      ? "${DateTime.now().difference(time).inDays ~/ 365}y"
      : DateTime.now().difference(time).inDays > 7
          ? "${DateTime.now().difference(time).inDays ~/ 7}w"
          : DateTime.now().difference(time).inDays > 1
              ? "${DateTime.now().difference(time).inDays}d"
              : DateTime.now().difference(time).inHours > 1
                  ? "${DateTime.now().difference(time).inHours}h"
                  : "${DateTime.now().difference(time).inMinutes}m";
}
