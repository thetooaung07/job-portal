import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/model/job_post_model.dart';
import 'package:job_portal/widgets/job-post-card-vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_page_controller.dart';
import 'package:job_portal/view/search_page/filter_bottom_sheet.dart';
import 'package:job_portal/widgets/showAllTextBanner.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchPageController controller = Get.put(SearchPageController());

    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              Get.find<BottomNavBarController>().selectedIndex.value = 0;
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Search",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Get.bottomSheet(FilterBottomSheet(), isScrollControlled: true);
              },
              child: Center(
                  child: SvgPicture.asset(
                'assets/icons/slider_icon.svg',
                height: 20,
                width: 20,
                color: Colors.black,
              )),
            ),
            //        ,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    child: SearchBar(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            icon: Icon(
                              Icons.clear_rounded,
                            ),
                            onPressed: () {
                              controller.clearText();
                            })),
                  ),
                ],
              ),
            ),
            //Filter Result
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            //   child: Obx(() => controller.searchTitle.value.isNotEmpty
            //       ? SizedBox(
            //           height: 45,
            //           child: ListView.builder(
            //             itemCount: 1,
            //             scrollDirection: Axis.horizontal,
            //             itemBuilder: (context, index) => SearchTag(),
            //           ),
            //         )
            //       : SizedBox(
            //           height: 1,
            //         )),
            // ),

            GetX<SearchPageController>(
              init: Get.put<SearchPageController>(SearchPageController()),
              builder: (controller) {
                return controller.initialized && controller.jobPosts.length > 0
                    ? Column(
                        children: [
                          ShowAllTextBanner(
                              title:
                                  "${controller.jobPosts.length} Jobs Available"),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: controller.jobPosts.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return JobPostCardVt(
                                data: controller.jobPosts[index],
                              );
                            },
                          ),
                        ],
                      )
                    : Container(
                        width: Get.width,
                        height: 70,
                        child: Center(
                            child: Text(
                          "No Data found for   \"${controller.searchTitle}\" ",
                          style: kBulletListTextStyle,
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTag extends StatelessWidget {
  const SearchTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO : connect with Filters
    // final SearchTitleController _controller = Get.find<SearchTitleController>();

    return Stack(
      children: [
        Container(
          height: 45,
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.only(left: 5, top: 7, right: 7),
          decoration: BoxDecoration(
            color: kPrimaryRedColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Stack(
              children: [
                Text(
                  "Full-Time",
                  overflow: TextOverflow.ellipsis,
                  style: kLabelTextStyle.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 2,
          top: 2,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kCloseBtnShadow],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(Icons.close_rounded,
                  color: Colors.black, size: 13, shadows: [kIconShadow]),
            ),
          ),
        ),
      ],
    );
  }
}
