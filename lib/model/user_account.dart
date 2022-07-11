import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  User? user;
  String? username;
  String? email;
  String? password;
  String? userId;
  bool? cvFile;
  bool? profileDetails;
  bool? addABio;

  UserAccount(
      {this.user,
      this.userId,
      this.username,
      this.email,
      this.password,
      this.cvFile,
      this.profileDetails,
      this.addABio});

  UserAccount.fromDocumentSnapshot(DocumentSnapshot doc) {
    userId = doc.id;
    username = doc["username"];
    email = doc["email"];
    password = doc["password"];
    cvFile = doc["cv_file"];
    profileDetails = doc["profile_details"];
    addABio = doc["add_a_bio"];
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "password": password,
        "cv_file": cvFile,
        "profile_details": profileDetails,
        "add_a_bio": addABio,
      };
}
