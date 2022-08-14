import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicantModel {
  String id = "";
  String? applicantId;
  String? applicantName;
  String? email;
  String? phoneNumber;
  String? address;
  String? summary;
  String? cvForm;
  String? techStacks;
  String? workExp;
  Map<String, dynamic>? socialLinks;
  String? suggestion;
  String? question;
  String? jobPostId;
  String? applicationProcess;

  ApplicantModel({
    required this.id,
    this.applicantId,
    this.applicantName,
    this.email,
    this.phoneNumber,
    this.cvForm,
    this.address,
    this.summary,
    this.techStacks,
    this.workExp,
    this.socialLinks,
    this.suggestion,
    this.question,
    this.jobPostId,
    this.applicationProcess,
  });

  ApplicantModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    applicantId = doc["applicantId"];
    applicantName = doc["applicantName"];
    email = doc["email"];
    phoneNumber = doc["phoneNumber"];
    cvForm = doc["cvForm"];
    address = doc["address"];
    summary = doc["summary"];
    techStacks = doc["techStacks"];
    workExp = doc["workExp"];
    socialLinks = doc["socialLinks"] as Map<String, dynamic>;
    suggestion = doc["suggestion"];
    question = doc["question"];
    jobPostId = doc["jobPostId"];
    applicationProcess = doc["applicationProcess"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "jobPostId": jobPostId,
        "applicantId": applicantId,
        "applicantName": applicantName,
        "email": email,
        "phoneNumber": phoneNumber,
        "cvForm": cvForm,
        "address": address,
        "summary": summary,
        "techStacks": techStacks,
        "workExp": workExp,
        "socialLinks": socialLinks,
        "suggestion": suggestion,
        "question": question,
        "applicationProcess": applicationProcess,
      };

  @override
  String toString() {
    // TODO: implement toString
    return "$id => $applicantId $applicantName $email $phoneNumber $cvForm $applicationProcess";
  }
}
