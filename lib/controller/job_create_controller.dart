import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_account.dart';
import 'package:job_portal/model/user_jobPosts_model.dart';
import 'package:job_portal/services/database.dart';

enum WorkType {
  company,
  work_from_home,
  hybrid,
}

class JobCreateController extends GetxController {
  TextEditingController titleC = new TextEditingController();
  TextEditingController expLevelC = new TextEditingController();
  TextEditingController techSkillC = new TextEditingController();
  TextEditingController workHourC = new TextEditingController();

  TextEditingController salaryC = new TextEditingController();
  TextEditingController companyLocationC = new TextEditingController();
  TextEditingController companyNameC = new TextEditingController();
  TextEditingController companyWebsiteC = new TextEditingController();
  TextEditingController companyContactMailC = new TextEditingController();
  TextEditingController requirementsC = new TextEditingController();
  TextEditingController responsibilitiesC = new TextEditingController();

  Rx<WorkType> selectedType = WorkType.company.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleC.text = "Web Developer";
    expLevelC.text = "Mid Senior";
    techSkillC.text = "Js, React, Api";
    workHourC.text = "9am-5pm";
    selectedType.value = WorkType.company;
    salaryC.text = "1200-1500";
    companyLocationC.text = "Yangon";
    companyNameC.text = "XSoftware House";
    companyWebsiteC.text = "abc.web.com";
    companyContactMailC.text = "abc@gmail.com";
    requirementsC.text =
        "Need to work first\nPositive attitude\nWork under pressure\nmust come to company";
    responsibilitiesC.text =
        "Need to maintain quality code\nAble to provide new features per customer's need\nAble to meet deadline";
  }

  RxList docIdList = <String>[].obs;

  void printController() {
    print(titleC.text);
    print(expLevelC.text);
    print(techSkillC.text);
    print(workHourC.text);
    print(salaryC.text);
    print(selectedType.value);
    print(companyLocationC.text);
    print(companyNameC.text);
    print(companyWebsiteC.text);
    print(companyContactMailC.text);
    print(requirementsC.text);
    print(responsibilitiesC.text);
  }

  void clear() {
    titleC.clear();
    expLevelC.clear();
    techSkillC.clear();
    workHourC.clear();
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
    workHourC.dispose();
    salaryC.dispose();
    companyLocationC.dispose();
    companyNameC.dispose();
    companyWebsiteC.dispose();
    companyContactMailC.dispose();
    requirementsC.dispose();
    responsibilitiesC.dispose();
    super.onClose();
  }

  List<String> stringToList(String data) {
    List<String> c = [];
    if (data.contains(RegExp(r'\n'))) {
      c = data.replaceAll('\n', '.').split(".");
    }

    List<String> result = [];

    c.forEach((element) {
      if (element.isEmpty)
        return;
      else
        result.add(element);
    });
    return result;
  }

  Future createJobPost() async {
    DocumentReference doc =
        await firebaseFirestore.collection("jobPosts").doc();
    String documentID = doc.id;

    UserAccount user =
        await FirestoreHelper().getUser(firebaseAuth.currentUser!.uid);

    JobPostUser jobPostUser = JobPostUser(
        profile: user.profile, userId: user.userId, username: user.username);

    JobPostModel _job = new JobPostModel(
        postUserId: firebaseAuth.currentUser!.uid,
        id: documentID,
        title: titleC.text,
        postedBy: jobPostUser,
        workType: selectedType.value,
        expLevel: expLevelC.text,
        workHour: workHourC.text,
        companyName: companyNameC.text,
        companyLocation: companyLocationC.text,
        companyWebsite: companyWebsiteC.text,
        salary: salaryC.text,
        responsibilities: stringToList(responsibilitiesC.text),
        companyContactMail: companyContactMailC.text,
        requirements: stringToList(requirementsC.text),
        techSkill: stringToList(techSkillC.text),
        createdAt: DateTime.now());

    await FirestoreHelper().create(
        collectionPath: "jobPosts", docPath: documentID, data: _job.toJson());
    // user_jobPosts Joint Table
    /* UserJobPostsModel _uJP = new UserJobPostsModel(
        postId: documentID, isExpired: false, createdAt: DateTime.now());

    await FirestoreHelper().create(
      collectionPath: "user_jobPosts",
      docPath: loginUserID,
      data: _uJP.toFirestore(),
    ); */

    await Fluttertoast.showToast(
      msg: "Success",
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    clear();
    Get.back();
  }
}
