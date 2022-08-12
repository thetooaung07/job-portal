import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class BulletListContainer extends StatelessWidget {
  final String titile;
  final List data;

  const BulletListContainer(
      {Key? key, required this.titile, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 25, top: 10),
          child: Text(
            "Responsibilities",
            style: kLabelTextStyle,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) => BulletText(
            text: data[index],
          ),
        )
      ],
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.fiber_manual_record_rounded,
              size: 11,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              style: kBulletListTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
