import 'package:cloud_firestore/cloud_firestore.dart';

class JobPostModel {
  String title = "";
  // String jobPosition = ""; // Eg. Developer, IT Support, UI/UX Designer
  String expLevel = ""; // Eg. Mid-Level, Intern, Senior;
  List<String> techSkill = []; // Eg. Mid-Level, Intern, Senior;
  String companyLocation = ""; // WFH or on Campus,
  String companyName = ""; // US,
  String companyWebsite = ""; // 9 to 5
  String salary = ""; // Min - Max
  String companyContactMail = "";
  List<String> responsibilities = [];
  List<String> requirements = [];
  String postedBy = "";
  DateTime createdAt = DateTime.now();

  JobPostModel({
    required this.title,
    required this.postedBy,
    // required this.jobPosition,
    required this.expLevel,
    required this.companyName,
    required this.companyLocation,
    required this.companyWebsite,
    required this.salary,
    required this.responsibilities,
    required this.companyContactMail,
    required this.requirements,
    required this.techSkill,
    required this.createdAt,
  });

  JobPostModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    title = doc["title"];
    postedBy = doc["postedBy"];
    // jobPosition = doc["jobPosition"];
    expLevel = doc["expLevel"];
    companyName = doc["companyName"];
    companyWebsite = doc["companyWebsite"];
    companyLocation = doc["companyLocation"];
    salary = doc["salary"];
    companyContactMail = doc["companyContactMail"];
    responsibilities = doc["responsibilities"];
    requirements = doc["requirements"];
    techSkill = doc["techSkills"];
    createdAt = (doc['createdAt'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        // "jobPosition": jobPosition,
        "expLevel": expLevel,
        "companyName": companyName,
        "companyWebsite": companyWebsite,
        "salary": salary,
        "responsibilities": responsibilities,
        "requirements": requirements,
        "techSkills": techSkill,
        "companyLocation": companyLocation,
        "companyContactMail": companyContactMail,
        "createdAt": createdAt,
      };
}
