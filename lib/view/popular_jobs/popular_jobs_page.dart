import 'package:flutter/material.dart';
import 'package:job_portal/widgets/job_post_card_vt.dart';

class PopularJobsPage extends StatelessWidget {
  const PopularJobsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Jobs"),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => const JobPostCardVt(),
        ),
      ),
    );
  }
}
