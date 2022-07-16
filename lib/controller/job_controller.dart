import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:job_portal/model/job_model.dart';
import 'package:job_portal/services/database.dart';

class JobController extends GetxController {
  TextEditingController titleC = new TextEditingController();
  TextEditingController expLevelC = new TextEditingController();
  TextEditingController techSkillC = new TextEditingController();
  TextEditingController salaryC = new TextEditingController();
  TextEditingController companyLocationC = new TextEditingController();
  TextEditingController companyNameC = new TextEditingController();
  TextEditingController companyWebsiteC = new TextEditingController();
  TextEditingController companyContactMailC = new TextEditingController();
  TextEditingController requirementsC = new TextEditingController();
  TextEditingController responsibilitiesC = new TextEditingController();

  void clear() {
    titleC.clear();
    expLevelC.clear();
    techSkillC.clear();
    salaryC.clear();
    companyLocationC.clear();
    companyNameC.clear();
    companyWebsiteC.clear();
    companyContactMailC.clear();
    requirementsC.clear();
    responsibilitiesC.clear();
  }

  @override
  void onClose() {
    titleC.dispose();
    expLevelC.dispose();
    techSkillC.dispose();
    salaryC.dispose();
    companyLocationC.dispose();
    companyNameC.dispose();
    companyWebsiteC.dispose();
    companyContactMailC.dispose();
    requirementsC.dispose();
    responsibilitiesC.dispose();
    super.onClose();
  }

  //  createJobPost() {
  //     FirestoreHelper().create(collectionPath: "jobPosts",docPath: "",  data: data)
  // }
}
