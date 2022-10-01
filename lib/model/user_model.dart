import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late UserInfoModel userInfoModel;
  List postedJobIds = [];
  List appliedJobIds = [];
  late UserJobProfileModel userJobProfileModel;

  UserModel({
    required this.userInfoModel,
    required this.postedJobIds,
    required this.appliedJobIds,
    required this.userJobProfileModel,
  });

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    userInfoModel = UserInfoModel.fromDocumentSnapshot(doc["user_info"]);
    postedJobIds = doc["posted_jobs_id"] as List;
    appliedJobIds = doc["applied_jobs_id"] as List;
    userJobProfileModel =
        UserJobProfileModel.fromDocumentSnapshot(doc["user_job_profile"]);
  }

  Map<String, dynamic> toJson() => {
        "user_info": userInfoModel.toJson(),
        "posted_jobs_id": postedJobIds,
        "applied_jobs_id": appliedJobIds,
        "user_job_profile": userJobProfileModel.toJson(),
      };

  @override
  String toString() {
    // TODO: implement toString
    return "${userInfoModel.userId} - ${userInfoModel.username}";
  }
}

class UserInfoModel {
  late String username;
  late String email;
  late String password;
  late String userId;
  String? phoneNumber;
  String? profileLink;
  String? gender;

  UserInfoModel({
    required this.username,
    required this.email,
    required this.password,
    required this.userId,
    this.phoneNumber,
    this.profileLink,
    this.gender,
  });

  UserInfoModel.fromDocumentSnapshot(Map doc) {
    username = doc["username"];
    email = doc["email"];
    password = doc["password"];
    userId = doc["user_id"];
    phoneNumber = doc["phone_number"];
    profileLink = doc["profile_link"];
    gender = doc["gender"];
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "user_id": userId,
        "phone_number": phoneNumber,
        "profile_link": profileLink,
        "gender": gender,
      };
}

class UserJobProfileModel {
  String? skillLevel;
  String? workExp;
  List<String>? techStacks;
  String? portfolio;
  List<Map>? socialLinks;
  String? selfIntro;
  String? cvForm;

  UserJobProfileModel({
    this.skillLevel,
    this.workExp,
    this.techStacks,
    this.portfolio,
    this.socialLinks,
    this.selfIntro,
    this.cvForm,
  });

  UserJobProfileModel.fromDocumentSnapshot(Map doc) {
    skillLevel = doc["skill_level"];
    workExp = doc["work_experience"];
    techStacks = doc["tech_stacks"];
    portfolio = doc["portfolio"];
    socialLinks = doc["social_links"];
    selfIntro = doc["selfIntro"];
    cvForm = doc["cvForm"];
  }

  Map<String, dynamic> toJson() => {
        "skill_level": skillLevel,
        "work_experience": workExp,
        "tech_stacks": techStacks,
        "portfolio": portfolio,
        "social_links": socialLinks,
        "selfIntro": selfIntro,
        "cvForm": cvForm,
      };
}
