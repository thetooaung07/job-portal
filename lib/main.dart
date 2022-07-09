import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/view/account_page.dart';
import 'package:job_portal/view/applied_page.dart';
import 'package:job_portal/view/nearby_page.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/top_company_container.dart';
import 'package:job_portal/widgets/suggested_job_container.dart';
import 'package:job_portal/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(UserAccountController());
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
      initialRoute: RouteNames.login,
      getPages: routes(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController controller = Get.put(BottomNavBarController());

    final List<Widget> _pages = [
      HomePageView(),
      NearbyPage(),
      AppliedPage(),
      AccountPage(),
    ];

    return Scaffold(
      backgroundColor: themeBgMainColor,

      body: Obx(
        () => _pages[controller.selectedIndex.value],
      ),
      // body: PageView(
      //   children: [
      //     HomePageView(),
      //     NearbyPage(),
      //     AppliedPage(),
      //     AccountPage(),
      //   ],
      //   controller: controller.pageController,
      //   onPageChanged: (index) {
      //     controller.selectedIndex.value = index;
      //   },
      // ),
      bottomNavigationBar: BottomNavBarConstraints(
        child: CustomBottomNavBar(),
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
    return Scaffold(
      appBar: MyAppBar(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: CustomIconButton(
            onTap: (() => {}),
            child: Icon(
              Icons.clear_all_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ),
        label: "QWERTY",
        action: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
            child: CustomIconButton(
              onTap: (() => Get.toNamed(RouteNames.search)),
              child: Icon(
                Icons.search_rounded,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
      // margin: EdgeInsets.all(_width * 0.05),
      height: MediaQuery.of(context).size.width * 0.255,
      color: color ?? Colors.white,

      child: child,
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
            boxShadow: [kIconShadow],
          ),
          child: child),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final BottomNavBarController controller =
        Get.find<BottomNavBarController>();
    return Container(
      margin: EdgeInsets.all(_width * 0.05),
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
                    child: AnimatedContainer(
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
                            // ? kPrimaryRedColor.withOpacity(.1)
                            ? Colors.black
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
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
                        Row(
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
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                            ),
                          ],
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
                                  ? Color.fromARGB(255, 255, 255, 255)
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
