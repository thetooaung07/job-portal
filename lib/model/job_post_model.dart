import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/controller/job_create_controller.dart';

class JobPostModel {
  late String postUserId;
  late String id;
  late String title; // JS developer
  late String expLevel; // Eg. Mid-Level, Intern, Senior;
  late String workHour;
  late WorkType workType;
  late String companyLocation; // WFH or on Campus,
  late String companyName; // US,
  late String companyWebsite; // 9 to 5
  late String salary; // Min - Max
  late JobPostUser postedBy;
  late String companyContactMail;
  late List responsibilities;
  late List requirements;
  late List techSkill; // Eg. Mid-Level, Intern, Senior;
  late DateTime? createdAt;

  JobPostModel({
    required this.postUserId,
    required this.id,
    required this.title,
    required this.workHour,
    required this.postedBy,
    required this.expLevel,
    required this.workType,
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
    postedBy = JobPostUser.fromMap(doc["postedBy"]);
    expLevel = doc["expLevel"];
    workHour = doc["workHour"];
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
        "workHour": workHour.toString(),
        "postedBy": postedBy.toMap(),
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

class JobPostUser {
  late String? username;
  late String? profile;
  late String? userId;

  JobPostUser({this.username = "", this.userId = "", this.profile = ""});

  JobPostUser.fromMap(Map doc) {
    username = doc["username"];
    profile = doc["profile"];
    userId = doc["userId"];
  }

  Map<String, dynamic> toMap() => {
        "username": username,
        "profile": profile,
        "userId": userId,
      };
}
