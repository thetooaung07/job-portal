import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String title = "";
  String jobPosition = ""; // Eg. Developer, IT Support, UI/UX Designer
  String expLevel = ""; // Eg. Mid-Level, Intern, Senior;
  List<String> techSkills = []; // Eg. Mid-Level, Intern, Senior;
  String companyLocation = ""; // WFH or on Campus,
  String companyName = ""; // US,
  String companyWebsite = ""; // 9 to 5
  String salary = ""; // Min - Max
  String companyContactMail = "";
  List<String> responsibilities = [];
  List<String> requirements = [];
  String postedBy = "";
  // String minSalary = ""; // Min - Max
  // String maxSalary = ""; // Min - Max

  JobModel(
      {required this.title,
      required this.postedBy,
      required this.jobPosition,
      required this.expLevel,
      required this.companyName,
      required this.companyLocation,
      required this.companyWebsite,
      required this.salary,
      // required this.maxSalary,
      required this.responsibilities,
      required this.companyContactMail,
      required this.requirements,
      required this.techSkills});

  JobModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    title = doc["companyName"];
    postedBy = doc["postedBy"];
    jobPosition = doc["hirePosition"];
    expLevel = doc["skillLevel"];
    companyName = doc["wrokLocation"];
    companyWebsite = doc["workHour"];
    companyLocation = doc["jobType"];
    salary = doc["minSalary"];
    // maxSalary = doc["maxSalary"];
    companyContactMail = doc["companyLogo"];
    responsibilities = doc["responsibilities"];
    requirements = doc["requirements"];
    techSkills = doc["techSkills"];
  }

  Map<String, dynamic> toJson() => {
        "companyName": title,
        "hirePosition": jobPosition,
        "skillLevel": expLevel,
        "wrokLocation": companyName,
        "workHour": companyWebsite,
        "minSalary": salary,
        // "maxSalary": maxSalary,
        "responsibilities": responsibilities,
        "requirements": requirements,
        "techSkills": techSkills,
        "jobType": companyLocation,
        "companyLogo": companyContactMail,
      };
}
