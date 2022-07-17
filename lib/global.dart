import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:job_portal/services/auth_service.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

final loginUserID = firebaseAuth.currentUser!.uid;

final AuthService authService = AuthService();

// final List<String> profileStats = [
//   "cvFile",
//   "profileDetails",
// ];
