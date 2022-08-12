class ProfileStats {
  bool? cvFile;
  bool? profileDetails;
  bool? addABio;

  ProfileStats(
      {this.cvFile = false, this.profileDetails = false, this.addABio = false});

  // ProfileStats.fromDocumentSnapshot(DocumentSnapshot doc) {
  //   cvFile = doc["cv_file"];
  //   profileDetails = doc["profile_details"];
  // }

  Map<String, dynamic> toJson() => {
        "cvFile": cvFile,
        "profileDetails": profileDetails,
        "addABio": addABio,
      };
}
