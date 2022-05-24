import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/view/most_relevent_tab.dart';
import 'package:job_portal/view/recent_posts/most_recent_tab.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: SearchBar(),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
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
            Text(
              "24 Jobs Opportunities found",
            ),
            Expanded(child: SearchPageTabView()),
          ],
        ),
      ),
    );
  }
}

class SearchPageTabView extends StatefulWidget {
  SearchPageTabView({Key? key}) : super(key: key);

  @override
  State<SearchPageTabView> createState() => _SearchPageTabViewState();
}

class _SearchPageTabViewState extends State<SearchPageTabView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: controller,
          tabs: [
            Tab(child: Text("Most Relevent")),
            Tab(child: Text("Most Recent")),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              MostRecentTab(),
              MostReleventTab(),
            ],
          ),
        )
      ],
    );
  }
}

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 100,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
        ),
      ],
    );
  }
}
