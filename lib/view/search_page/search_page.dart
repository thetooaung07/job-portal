import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_title_controller.dart';
import 'package:job_portal/view/search_page/filter_bottom_sheet.dart';
import 'package:job_portal/view/search_page/search_page_tab_view.dart';
import 'package:job_portal/widgets/showAllTextBanner.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchTitleController _controller =
        Get.put(SearchTitleController(), tag: "search_bar");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            //Filter Result
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Obx(() => _controller.searchTitle.value.isNotEmpty
                  ? SizedBox(
                      height: 70,
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => SearchTag(),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    )),
            ),
            Column(
              children: [
                ShowAllTextBanner(title: "14 Jobs Available"),
                JobPostCardVt(),
                JobPostCardVt(),
                JobPostCardVt(),
                JobPostCardVt(),
                JobPostCardVt(),
                JobPostCardVt(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: Change SearchTag Style
class SearchTag extends StatelessWidget {
  const SearchTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchTitleController _controller = Get.find(tag: "search_bar");

    return Stack(
      children: [
        Container(
          height: 30,
          width: (Get.width * 0.3) - 20,
          margin: EdgeInsets.only(left: kSpacingUnit, top: 7, right: 7),
          decoration: BoxDecoration(
            color: kPrimaryRedColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
              ],
            ),
          ),
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            height: 17,
            width: 17,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kIconShadow],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.close_rounded,
                  color: kPrimaryRedColor, size: 14, shadows: [kCardShadow]),
            ),
          ),
        ),
      ],
    );
  }
}
