// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:job_portal/widgets/bottom_navigation_bar/bottom_nav_bar_item.dart';
// import 'package:job_portal/controller/bottom_nav_bar_controller.dart';

// List<Map<String, dynamic>> navBarItem = [
//   {
//     "index": 0,
//     "icon": Icons.home_rounded,
//     "label": "Home",
//   },
//   {
//     "index": 1,
//     "icon": Icons.work_rounded,
//     "label": "Jobs",
//   },
//   {
//     "index": 2,
//     "icon": Icons.notifications_rounded,
//     "label": "Notifications",
//   },
//   {
//     "index": 3,
//     "icon": Icons.person_rounded,
//     "label": "Profile",
//   },
// ];

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BottomNavBarController _controller = Get.find();

//     return ClipRRect(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30),
//         topRight: Radius.circular(30),
//       ),
//       child: Container(
//         height: 60,
//         decoration: BoxDecoration(
//           color: Colors.red,
//         ),
//         width: Get.width,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: navBarItem.map(
//             (item) {
//               return Expanded(
//                 child: BottomNavBarItem(
//                   onPressed: () {
//                     _controller.onPageChange(item["index"]);
//                   },
//                   index: item["index"],
//                   label: item["label"],
//                   icon: Icon(item["icon"]),
//                 ),
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }
