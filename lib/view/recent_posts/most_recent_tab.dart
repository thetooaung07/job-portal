import 'package:flutter/cupertino.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';

class MostRecentTab extends StatelessWidget {
  const MostRecentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => JobPostCardVt(),
      ),
    );
  }
}
