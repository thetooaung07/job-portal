import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicantModel {
  String? applicantId;
  String? applicantName;
  String? email;
  String? phoneNumber;
  String? address;
  String? summary;
  String? cvForm;
  String? techStacks;
  String? workExp;
  List? socialLinks;
  String? suggestion;
  String? question;
  String? jobPostId;

  ApplicantModel({
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
  });

  ApplicantModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    applicantId = doc["applicantId"];
    applicantName = doc["applicantName"];
    email = doc["email"];
    phoneNumber = doc["phoneNumber"];
    cvForm = doc["cvForm"];
    address = doc["address"];
    summary = doc["summary"];
    techStacks = doc["techStacks"];
    workExp = doc["workExp"];
    socialLinks = doc["socialLinks"] as List;
    suggestion = doc["suggestion"];
    question = doc["question"];
    jobPostId = doc["jobPostId"];
  }

  Map<String, dynamic> toJson() => {
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
      };

  @override
  String toString() {
    // TODO: implement toString
    return "$applicantId $applicantName $email $phoneNumber $cvForm ";
  }
}
