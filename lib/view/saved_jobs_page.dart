import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          leading: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: CustomIconButton(
              onTap: (() => Get.back()),
              child: Icon(
                Icons.chevron_left_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          label: "Saved",
          action: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: CustomIconButton(
                onTap: (() => Get.toNamed(RouteNames.search)),
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) => DismissibleJobPostCard(
            index: index,
          ),
        ));
  }
}

class DismissibleJobPostCard extends StatelessWidget {
  final int index;

  const DismissibleJobPostCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // TODO: remove Item on dismiss
      },
      background: Container(
        // margin: EdgeInsets.symmetric(horizontal: 15),
        // padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 15, 25),
          decoration: BoxDecoration(
              color: kPrimaryRedColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              )),
          child: Icon(
            Icons.delete_outline_rounded,
            size: 25,
            color: Colors.white,
          ),
        ),
      ),
      child: JobPostCardVt(
        includeSave: true,
      ),
    );
  }
}
