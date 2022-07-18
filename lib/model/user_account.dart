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
  String? profile;

  UserAccount(
      {this.user,
      this.userId,
      this.username,
      this.email,
      this.password,
      this.cvFile,
      this.profileDetails,
      this.addABio,
      this.profile});

  UserAccount.fromDocumentSnapshot(DocumentSnapshot doc) {
    userId = doc.id;
    username = doc["username"];
    email = doc["email"];
    password = doc["password"];
    cvFile = doc["cvFile"];
    profileDetails = doc["profileDetails"];
    addABio = doc["addABio"];
    profile = doc["profile"];
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "email": email,
        "password": password,
        "cvFile": cvFile,
        "profileDetails": profileDetails,
        "addABio": addABio,
        "profile": profile,
      };
}
