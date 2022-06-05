import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class JobPostCardVt extends StatelessWidget {
  const JobPostCardVt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      margin: EdgeInsets.only(
          left: kSpacingUnit * 1.5,
          right: kSpacingUnit * 1.5,
          bottom: kSpacingUnit * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.teal)
          // TODO: Add colors and remove Card later
          // color: Colors.teal,
          ),
      height: 125,
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(right: 15),
      //           color: Colors.cyan,
      //           width: 45,
      //           height: 45,
      //         ),
      //       ],
      //     ),
      //     Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 7.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text("Facebook"),
      //                     Text(
      //                       "UI/UX Designer",
      //                       style: kTitleTextStyle,
      //                     ),
      //                   ],
      //                 ),
      //                 Icon(Icons.favorite_outline),
      //               ],
      //             ),
      //           ),
      //           // Padding(
      //           //   padding: const EdgeInsets.only(bottom: 10.0),
      //           //   child: Text(
      //           //     "UI/UX Designer",
      //           //     style: kTitleTextStyle,
      //           //   ),
      //           // ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Expanded(
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         Text("\$140K/month"),
      //                         SizedBox(
      //                           width: 20,
      //                         ),
      //                         Flexible(
      //                           child: Text(
      //                             "USA Califonia sadasda",
      //                             overflow: TextOverflow.ellipsis,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 3,
      //                     ),
      //                     Text("Full-time asdadasdasd"),
      //                   ],
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Text("12h"),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    color: Colors.cyan,
                    width: 60,
                    height: 60,
                  ),
                  Text("junior Node.js Developer"),
                ],
              ),
              Icon(Icons.favorite_outline_rounded),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Full Time"),
                  SizedBox(width: 15),
                  Text("Mid-Senior"),
                ],
              ),
              Text("2 hr ago")
            ],
          ),
        ],
      ),
    );
  }
}

class BubbleContainer extends StatelessWidget {
  final Widget child;
  const BubbleContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue[300]),
      child: child,
    );
  }
}
