import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_page_controller.dart';

class SearchBar extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const SearchBar({Key? key, this.prefixIcon, this.suffixIcon})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      builder: (controller) {
        return TextFormField(
          autofocus: false,
          controller: controller.textEditingController,
          onChanged: (v) => controller.getTitleFromSearchBar(v),
          style: const TextStyle(
            color: kPrimaryRedColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: "Search job",
            hintStyle: const TextStyle(
              color: Color.fromARGB(111, 0, 0, 0),
            ),
            filled: true,
            fillColor: kSilverColor,

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1,
                )),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1,
                )),
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,
          ),
        );
      },
    );
  }
}




//To change the Input UI you need to define both enableBorder and border and focusBorder
