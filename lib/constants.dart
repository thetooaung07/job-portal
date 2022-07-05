import 'package:flutter/material.dart';

const String bullet = "\u2022 ";

const List<String> bottomNavBarLabels = [
  'Home',
  'Nearby',
  'Applied',
  'Account',
];

const List<IconData> bottomNavBarIcons = [
  Icons.home_rounded,
  Icons.radar_rounded,
  Icons.work_history_outlined,
  Icons.person_outline_rounded,
];

const themeBgColor = Color.fromARGB(255, 245, 245, 245);
const themeBgMainColor = Color.fromARGB(255, 253, 253, 253);
const jobDetailsTabBgColor = Color.fromARGB(242, 240, 240, 240);

//  TODO: Change Color to linear from up(dark) to down(light) like pale color at bottom
const btnColor = Color.fromRGBO(35, 35, 35, 1);
const btnBgColorWhite = Color.fromRGBO(255, 255, 255, 1);
const btnBgColorGrey = Color.fromRGBO(35, 35, 35, 1);
const kPrimaryRedColor = Color.fromRGBO(250, 88, 4, 1);
const kTextBodyFadeColor = Color.fromARGB(185, 0, 0, 0);

const double kSpacingUnit = 10;
const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const TextStyle kLogoTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
const TextStyle kJobPositionTextStyle = TextStyle(
  fontSize: 18,
  color: Color.fromARGB(255, 63, 63, 63),
  fontWeight: FontWeight.w500,
);
const BoxShadow kCardShadow = BoxShadow(
  color: Color.fromARGB(20, 0, 0, 0),
  blurRadius: 5,
  offset: Offset(2, 0),
  spreadRadius: 2,
);
const BoxShadow kIconShadow = BoxShadow(
  color: Color.fromARGB(19, 122, 122, 122),
  blurRadius: 4,
  offset: Offset(2, 2),
  spreadRadius: 2,
);
const BoxShadow kCloseBtnShadow = BoxShadow(
  color: Color.fromARGB(20, 0, 0, 0),
  blurRadius: 1,
  offset: Offset(1, -1),
  spreadRadius: 0.5,
);

// const BoxShadow kProfileCardShadow = BoxShadow(
//   color: Color.fromARGB(22, 0, 0, 0),
//   blurRadius: 10,
//   offset: Offset(1, 0),
//   spreadRadius: 10,
// );

const TextStyle kBulletListTextStyle = TextStyle(
  fontSize: 15,
  color: kTextBodyFadeColor,
);
// TODO: Change font size initialize for error removing

const Color kSilverColor = Color(0xFFF6F7FB);

const kCaptionTextStyle = TextStyle(fontSize: 18, color: Colors.black);
const kBodyTextStyle = TextStyle(fontSize: 14, color: Colors.black);
