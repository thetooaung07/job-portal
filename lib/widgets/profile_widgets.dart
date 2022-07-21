import 'package:flutter/material.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/model/user_account.dart';

class AccountPageProfile extends StatelessWidget {
  final AsyncSnapshot<UserAccount> snapshot;
  final UserAccountController controller;

  const AccountPageProfile(
      {Key? key, required this.snapshot, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.active &&
        snapshot.hasData &&
        controller.isUploading == false)
      return CircleAvatar(
        backgroundImage: NetworkImage(snapshot.data!.profile!),
        // AssetImage("assets/images/default.png"),
        backgroundColor: Colors.transparent,
        radius: 50,
      );
    else if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data?.profile == null ||
        snapshot.data?.profile == "")
      return CircleAvatar(
        backgroundImage: AssetImage("assets/images/default.png"),
        backgroundColor: Colors.transparent,
        radius: 50,
      );
    else
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50,
        child: CircularProgressIndicator(
          color: Colors.black54,
        ),
      );
  }
}
