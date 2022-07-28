// import 'package:flutter/material.dart';
// import 'package:job_portal/constants.dart';
// import 'package:job_portal/view/most_relevent_tab.dart';
// import 'package:job_portal/view/recent_posts/most_recent_tab.dart';

// class SearchPageTabView extends StatefulWidget {
//   SearchPageTabView({Key? key}) : super(key: key);

//   @override
//   State<SearchPageTabView> createState() => _SearchPageTabViewState();
// }

// class _SearchPageTabViewState extends State<SearchPageTabView>
//     with SingleTickerProviderStateMixin {
//   late TabController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 2, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Theme(
//           data: ThemeData().copyWith(
//               hoverColor: Colors.transparent,
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: TabBar(
//               unselectedLabelColor: Colors.black,
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicator: BoxDecoration(
//                 color: kPrimaryRedColor,
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               controller: controller,
//               tabs: [
//                 Tab(child: Text("Most Relevent")),
//                 Tab(child: Text("Most Recent")),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: controller,
//             children: [
//               MostRecentTab(),
//               MostReleventTab(),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
