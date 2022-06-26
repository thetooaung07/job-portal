import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_title_controller.dart';
import 'package:job_portal/view/search_page/filter_bottom_sheet.dart';
import 'package:job_portal/view/search_page/search_page_tab_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchTitleController _controller =
        Get.put(SearchTitleController(), tag: "search_bar");

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppBar(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Search",
                      style: kLogoTextStyle,
                    ),
                    CustomIconButton(
                      onTap: () {
                        Get.bottomSheet(FilterBottomSheet(),
                            isScrollControlled: true);
                      },
                      child: Center(
                          child: SvgPicture.asset(
                        'assets/icons/slider_icon.svg',
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      )),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Flexible(
                  child: SearchBar(
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.clear),
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                  "Below this is the section,later needed to Change UI.s")),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Obx(
              () => _controller.searchTitle.value.isNotEmpty
                  ? Row(
                      children: [
                        SearchTag(),
                        Spacer(),
                        Text(
                          "24 Jobs Opportunities found",
                        ),
                      ],
                    )
                  : SizedBox(
                      height: 1,
                    ),
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
    final SearchTitleController _controller = Get.find(tag: "search_bar");

    return Container(
      height: kSpacingUnit * 2.5,
      width: kSpacingUnit * 9,
      margin: EdgeInsets.only(left: kSpacingUnit),
      decoration: BoxDecoration(
        color: kPrimaryRedColor,
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: kSpacingUnit),
            Flexible(
              child: Obx(
                () => Text(
                  _controller.searchTitle.value,
                  overflow: TextOverflow.ellipsis,
                  style: kCaptionTextStyle.copyWith(
                    color: Colors.white,
                  ),
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
