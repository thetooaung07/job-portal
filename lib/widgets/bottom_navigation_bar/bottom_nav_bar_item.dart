// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:job_portal/controller/bottom_nav_bar_controller.dart';

// class BottomNavBarItem extends StatelessWidget {
//   final int index;
//   final String label;
//   final Icon icon;
//   final Function() onPressed;

//   const BottomNavBarItem(
//       {Key? key,
//       required this.label,
//       required this.icon,
//       required this.index,
//       required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BottomNavBarController _controller = Get.find();

//     return Obx(
//       () => InkWell(
//         onTap: onPressed,
//         child: Container(
//           decoration: BoxDecoration(
//               color: _controller.selectedIndex.value == index
//                   ? Colors.teal
//                   : Colors.transparent),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               icon,
//               Text(
//                 label,
//                 style: TextStyle(overflow: TextOverflow.ellipsis),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
