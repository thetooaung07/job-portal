import 'package:flutter/material.dart';
import 'package:job_portal/components/recent_posts.dart';

class MostReleventTab extends StatelessWidget {
  const MostReleventTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => RecentPostCard(),
      ),
    );
  }
}
