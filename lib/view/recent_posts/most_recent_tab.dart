import 'package:flutter/cupertino.dart';
import 'package:job_portal/components/recent_posts.dart';

class MostRecentTab extends StatelessWidget {
  const MostRecentTab({Key? key}) : super(key: key);

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
