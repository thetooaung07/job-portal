import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAccount {
  User? user;
  String? username;
  String? email;
  String? password;
  String? userId;

  UserAccount(
      {this.user, this.userId, this.username, this.email, this.password});

  UserAccount.fromDocumentSnapshot(DocumentSnapshot doc) {
    userId = doc.id;
    username = doc["username"];
    email = doc["email"];
    password = doc["password"];
  }
}
