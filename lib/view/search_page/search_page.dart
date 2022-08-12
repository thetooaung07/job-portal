import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/widgets/job_post_card_vt.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/search_page_controller.dart';
import 'package:job_portal/view/search_page/filter_bottom_sheet.dart';
import 'package:job_portal/widgets/show_all_text_banner.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchPageController controller = Get.put(SearchPageController());

    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: () {
              Get.find<BottomNavBarController>().selectedIndex.value = 0;
            },
            child: const Icon(
              Icons.chevron_left_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "Search",
        action: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Get.bottomSheet(const FilterBottomSheet(),
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
            //        ,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Flexible(
                    child: SearchBar(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            icon: const Icon(
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
                return controller.initialized && controller.jobPosts.isNotEmpty
                    ? Column(
                        children: [
                          ShowAllTextBanner(
                              title:
                                  "${controller.jobPosts.length} Jobs Available"),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: controller.jobPosts.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return JobPostCardVt(
                                data: controller.jobPosts[index],
                              );
                            },
                          ),
                        ],
                      )
                    : SizedBox(
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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.only(left: 5, top: 7, right: 7),
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
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [kCloseBtnShadow],
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.close_rounded,
                  color: Colors.black, size: 13, shadows: [kIconShadow]),
            ),
          ),
        ),
      ],
    );
  }
}
