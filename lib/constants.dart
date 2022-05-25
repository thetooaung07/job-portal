import 'package:flutter/material.dart';

const Color kThemeColor = Colors.teal;
const double kSpacingUnit = 10.00;
const Color kSilverColor = Color(0xFFF6F7FB);
const Color kAccentColor = Color(0xFFED5575);
const Color kPrimaryTextColor = Color(0xFF211D42);
const Color kSecondaryTextColor = Color(0xFFB9B8CD);
const Color kBgColor = Color.fromRGBO(251, 251, 251, 1);

class assetsPath {
  static String iconPath = '/assets/icons';
  static String imagePath = '/assets/images';
}

const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(164, 0, 0, 0),
);

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
const TextStyle kBodyTextStyle = TextStyle(
  color: kPrimaryTextColor,
  fontSize: 13,
);

const BoxShadow kCardShadow = BoxShadow(
  color: Color.fromARGB(41, 0, 0, 0),
  blurRadius: 2,
  offset: Offset(1, 1),
  spreadRadius: 1,
);

const TextStyle kCardBodyTextStyle = TextStyle(
  color: Colors.white,
);

const kCaptionTextStyle = TextStyle(
  color: kSecondaryTextColor,
  fontSize: 12,
);
