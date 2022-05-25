import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/view/search_page/filter_bottom_sheet.dart';
import 'package:job_portal/view/search_page/search_page_tab_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      // backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: SearchBar(),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.bottomSheet(FilterBottomSheet(),
                        isScrollControlled: true);
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/icons/slider_icon.svg',
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                SearchTag(),
                SizedBox(width: 20),
                Text(
                  "24 Jobs Opportunities found",
                ),
              ],
            ),
          ),
          Expanded(child: SearchPageTabView()),
        ],
      ),
    );
  }
}

class SearchTag extends StatelessWidget {
  const SearchTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 2.5,
      width: kSpacingUnit * 9,
      margin: EdgeInsets.only(left: kSpacingUnit),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: kSpacingUnit),
            Flexible(
              child: Text(
                "Facebook",
                overflow: TextOverflow.ellipsis,
                style: kCaptionTextStyle.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/close_icon.svg',
              height: 15,
              width: 15,
            ),
            SizedBox(width: kSpacingUnit * 0.5),
          ],
        ),
      ),
    );
  }
}
