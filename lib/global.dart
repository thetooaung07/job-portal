import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/services/auth_service.dart';
import 'package:job_portal/services/storage.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

final loginUserID = firebaseAuth.currentUser!.uid;

final AuthService authService = AuthService();
final StorageService storageService = StorageService();
final ImagePicker imagePicker = ImagePicker();

// final List<String> profileStats = [
//   "cvFile",
//   "profileDetails",
// ];

void customPrint(dynamic title, dynamic res) {
  print(" $title => ${res}");
}
