import 'package:cloud_firestore/cloud_firestore.dart';

class JobPostModel {
  late String title;
  // String jobPosition ; // Eg. Developer, IT Support, UI/UX Designer
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
    required this.title,
    required this.postedBy,
    //  this.jobPosition,
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
    postedBy = doc.id;
    expLevel = doc["expLevel"];
    companyName = doc["companyName"];
    companyLocation = doc["companyLocation"];
    companyWebsite = doc["companyWebsite"];
    salary = doc["salary"];
    companyContactMail = doc["companyContactMail"];
    // responsibilities = (doc["responsibilities"] as List).map((e) => ).toList();
    requirements = doc["requirements"] as List;
    responsibilities = doc["responsibilities"] as List;
    techSkill = doc["techSkills"] as List;
    createdAt = (doc['createdAt'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() => {
        "title": title,
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
