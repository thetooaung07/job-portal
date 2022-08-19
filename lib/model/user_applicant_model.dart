import 'package:job_portal/model/applicant_model.dart';
import 'package:job_portal/model/user_account.dart';

class UserApplicantModel {
  final UserAccount user;
  final ApplicantModel applicant;

  UserApplicantModel({required this.user, required this.applicant});
}
