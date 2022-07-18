import 'package:cloud_firestore/cloud_firestore.dart';

class JobPostModel {
  late String postUserId;
  late String id;
  late String title; // JS developer
  late String expLevel; // Eg. Mid-Level, Intern, Senior;
  late String companyLocation; // WFH or on Campus,
  late String companyName; // US,
  late String companyWebsite; // 9 to 5
  late String salary; // Min - Max
  late String postedBy;
  late String companyContactMail;
  late List responsibilities;
  late List requirements;
  late List techSkill; // Eg. Mid-Level, Intern, Senior;
  late DateTime? createdAt;

  JobPostModel({
    required this.postUserId,
    required this.id,
    required this.title,
    required this.postedBy,
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

// to cloud firestore
  JobPostModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    postUserId = doc["postUserId"];
    id = doc["id"];
    title = doc["title"];
    postedBy = doc["postedBy"];
    expLevel = doc["expLevel"];
    companyName = doc["companyName"];
    companyLocation = doc["companyLocation"];
    companyWebsite = doc["companyWebsite"];
    salary = doc["salary"];
    companyContactMail = doc["companyContactMail"];
    requirements = doc["requirements"] as List;
    responsibilities = doc["responsibilities"] as List;
    techSkill = doc["techSkills"] as List;
    createdAt = (doc['createdAt'] as Timestamp).toDate();
  }

// to flutter
  Map<String, dynamic> toJson() => {
        "postUserId": postUserId,
        "id": id,
        "title": title,
        "expLevel": expLevel,
        "postedBy": postedBy,
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
