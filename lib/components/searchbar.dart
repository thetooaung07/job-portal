import 'package:flutter/material.dart';
import 'package:job_portal/constants.dart';

class SearchBar extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const SearchBar({Key? key, this.prefixIcon, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Color.fromARGB(162, 0, 0, 0),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon ?? null,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: "search job",
        hintStyle: TextStyle(
          color: Color.fromARGB(111, 0, 0, 0),
        ),
        filled: true,
        fillColor: kSilverColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            )),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            )),
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
    );
  }
}




//To change the Input UI you need to define both enableBorder and border and focusBorder
