import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/user_account.dart';

class UserApplicantModel {
  late UserAccount user;
  late ApplicantModel applicant;

  UserApplicantModel({required this.user, required this.applicant});

  UserApplicantModel.fromDocumentSnapshot(
      DocumentSnapshot userDoc, DocumentSnapshot applicantDoc) {
    user = UserAccount.fromDocumentSnapshot(userDoc);
    applicant = ApplicantModel.fromDocumentSnapshot(applicantDoc);
  }
}
