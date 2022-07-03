import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/view/account_page.dart';
import 'package:job_portal/view/applied_page.dart';
import 'package:job_portal/view/nearby_page.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/top_company_container.dart';
import 'package:job_portal/widgets/suggested_job_container.dart';
import 'package:job_portal/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(fontFamily: 'Circular').copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: kPrimaryRedColor),
      ),
      initialRoute: RouteNames.home,
      getPages: routes(),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final Color btnBgColor;
  final void Function()? onTap;
  const CustomIconButton(
      {Key? key,
      required this.child,
      this.onTap,
      this.btnBgColor = btnBgColorWhite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: btnBgColor,
              boxShadow: [kIconShadow]),
          child: child),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());

    return Scaffold(
      backgroundColor: themeBgMainColor,
      body: PageView(
        children: [
          HomePageView(),
          NearbyPage(),
          AppliedPage(),
          AccountPage(),
        ],
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: BottomNavBarConstraints(
        child: CustomBottomNavBar(),
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final double _width = Get.width;
    final BottomNavBarController controller =
        Get.find<BottomNavBarController>();
    return Container(
      margin: EdgeInsets.all(Get.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.onPageChange(index);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            child: Stack(
              children: [
                Obx(
                  () => AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == controller.selectedIndex.value
                        ? _width * 0.32
                        : _width * 0.18,
                    alignment: Alignment.center,
                    child: Obx(
                      () => AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == controller.selectedIndex.value
                            ? _width * 0.12
                            : 0,
                        width: index == controller.selectedIndex.value
                            ? _width * 0.32
                            : 0,
                        decoration: BoxDecoration(
                          color: index == controller.selectedIndex.value
                              ? kPrimaryRedColor.withOpacity(.1)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == controller.selectedIndex.value
                        ? _width * 0.31
                        : _width * 0.18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == controller.selectedIndex.value
                                    ? _width * 0.13
                                    : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == controller.selectedIndex.value
                                    ? 1
                                    : 0,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == controller.selectedIndex.value
                                      ? '${bottomNavBarLabels[index]}'
                                      : '',
                                  style: TextStyle(
                                      color: kPrimaryRedColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == controller.selectedIndex.value
                                  ? _width * 0.03
                                  : 20,
                            ),
                            Icon(
                              bottomNavBarIcons[index],
                              size: _width * 0.076,
                              color: index == controller.selectedIndex.value
                                  ? kPrimaryRedColor
                                  : Colors.black26,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                        child: Icon(
                          Icons.clear_all,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "QWERTY",
                        style: kLogoTextStyle,
                      ),
                      CustomIconButton(
                        onTap: (() => Get.toNamed(RouteNames.search)),
                        child: Icon(
                          Icons.search_rounded,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ]),
              ),
            ),

            //Popular Job
            TopCompanyContainer(),
            //Recent Post
            SuggestedJobContainer(),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarConstraints extends StatelessWidget {
  final Widget child;
  final Color? color;

  const BottomNavBarConstraints({Key? key, required this.child, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(Get.width * 0.05),
      height: Get.width * 0.255,
      color: color ?? Colors.white,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.1),
      //       blurRadius: 30,
      //       offset: Offset(0, 10),
      //     ),
      //   ],
      //   borderRadius: BorderRadius.circular(50),
      // ),
      child: child,
    );
  }
}
