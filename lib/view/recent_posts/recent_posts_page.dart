import 'package:flutter/material.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';

class RecentPostsPage extends StatelessWidget {
  const RecentPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Posts"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => JobPostCardVt(),
        ),
      ),
    );
  }
}
