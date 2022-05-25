import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_title_controller.dart';
import 'package:job_portal/routes/routes.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    final SearchTitleController _controller =
        Get.put(SearchTitleController(), tag: "search_bar");

    return TextFormField(
      controller: _textController,
      onChanged: (v) => _controller.getTitleFromSearchBar(v),
      onEditingComplete: () {
        _textController.text = _controller.searchTitle.value;
        _textController.clear();
        FocusManager.instance.primaryFocus?.unfocus();

        Get.toNamed(RouteNames.search);
      },
      style: TextStyle(
        color: Color.fromARGB(162, 0, 0, 0),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          splashRadius: null,
          icon: Icon(Icons.manage_search_rounded),
          onPressed: () {
            Get.toNamed(RouteNames.search);
          },
        ),
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
