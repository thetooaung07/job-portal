import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_title_controller.dart';
import 'package:job_portal/routes/routes.dart';

class SearchBar extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const SearchBar({Key? key, this.prefixIcon, this.suffixIcon})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final SearchTitleController _controller = Get.find(tag: "search_bar");
  final TextEditingController searchPageController =
      new TextEditingController();

  @override
  void initState() {
    searchPageController.text = _controller.searchTitle.value;
    super.initState();
  }

  @override
  void dispose() {
    searchPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchPageController,
      onChanged: (v) => _controller.getTitleFromSearchBar(v),
      onEditingComplete: () {
        Get.toNamed(RouteNames.search);
      },
      style: TextStyle(
        color: Color.fromARGB(162, 0, 0, 0),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon ?? null,
        suffixIcon: widget.suffixIcon ?? null,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: "Search job",
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
