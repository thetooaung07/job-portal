import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileStats {
  bool? cvFile;
  bool? profileDetails;

  ProfileStats({this.cvFile = false, this.profileDetails = false});

  ProfileStats.fromDocumentSnapshot(DocumentSnapshot doc) {
    cvFile = doc["cv_file"];
    profileDetails = doc["profileDetails"];
  }

  Map<String, dynamic> toJson() => {
        "cv_file": cvFile,
        "profileDetails": profileDetails,
      };
}
