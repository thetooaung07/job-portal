import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/model/user_jobPosts_model.dart';
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

  RxList docIdList = <String>[].obs;

  void printController() {
    print(titleC.text);
    print(expLevelC.text);
    print(techSkillC.text);
    print(salaryC.text);
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

  Future createJobPost() async {
    JobPostModel _job = new JobPostModel(
        title: titleC.text,
        postedBy: firebaseAuth.currentUser!.email.toString(),
        expLevel: expLevelC.text,
        companyName: companyNameC.text,
        companyLocation: companyLocationC.text,
        companyWebsite: companyWebsiteC.text,
        salary: salaryC.text,
        responsibilities: [responsibilitiesC.text],
        companyContactMail: companyContactMailC.text,
        requirements: [requirementsC.text],
        techSkill: [techSkillC.text],
        createdAt: DateTime.now());

    DocumentReference doc =
        await firebaseFirestore.collection("jobPosts").doc();
    String documentID = doc.id;
    // docIdList.add(documentID);

    await FirestoreHelper().create(
        collectionPath: "jobPosts", docPath: documentID, data: _job.toJson());
    print(documentID);

    UserJobPostsModel _uJP = new UserJobPostsModel(
        postId: documentID, isExpired: false, createdAt: DateTime.now());

    await FirestoreHelper().create(
      collectionPath: "user_jobPosts",
      docPath: loginUserID,
      data: _uJP.toFirestore(),
    );

    await Fluttertoast.showToast(
        msg: "Success",
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
