import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String companyName = "";
  String postedBy = "";
  String jobPosition = ""; // Eg. Developer, IT Support, UI/UX Designer
  String skillLevel = ""; // Eg. Mid-Level, Intern, Senior;
  List<String> techSkills = []; // Eg. Mid-Level, Intern, Senior;
  String jobType = ""; // WFH or on Campus,
  String wrokLocation = ""; // US,
  String workHour = ""; // 9 to 5
  String minSalary = ""; // Min - Max
  String maxSalary = ""; // Min - Max
  String companyLogo = "";
  List<String> responsibilities = [];
  List<String> requirements = [];

  JobModel(
      {required this.companyName,
      required this.postedBy,
      required this.jobPosition,
      required this.skillLevel,
      required this.wrokLocation,
      required this.jobType,
      required this.workHour,
      required this.minSalary,
      required this.maxSalary,
      required this.responsibilities,
      required this.companyLogo,
      required this.requirements,
      required this.techSkills});

  JobModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    companyName = doc["companyName"];
    postedBy = doc["postedBy"];
    jobPosition = doc["hirePosition"];
    skillLevel = doc["skillLevel"];
    wrokLocation = doc["wrokLocation"];
    workHour = doc["workHour"];
    jobType = doc["jobType"];
    minSalary = doc["minSalary"];
    maxSalary = doc["maxSalary"];
    companyLogo = doc["companyLogo"];
    responsibilities = doc["responsibilities"];
    requirements = doc["requirements"];
    techSkills = doc["techSkills"];
  }

  Map<String, dynamic> toJson() => {
        "companyName": companyName,
        "hirePosition": jobPosition,
        "skillLevel": skillLevel,
        "wrokLocation": wrokLocation,
        "workHour": workHour,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "responsibilities": responsibilities,
        "requirements": requirements,
        "techSkills": techSkills,
        "jobType": jobType,
        "companyLogo": companyLogo,
      };
}
