import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/controller/auth_page_controller.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/controller/data_controller/user_controller.dart';
import 'package:job_portal/controller/user_account_controller.dart';
import 'package:job_portal/global.dart';
import 'package:job_portal/view/account_page.dart';
import 'package:job_portal/view/jobs_page.dart';
import 'package:job_portal/view/search_page/search_page.dart';
import 'package:job_portal/widgets/my_app_bar.dart';
import 'package:job_portal/widgets/recent_posts_container.dart';
import 'package:job_portal/widgets/suggested_job_container.dart';
import 'package:job_portal/routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  Get.put(UserAccountController());

  Get.put(UserController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(fontFamily: 'OpenSans').copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: kPrimaryRedColor),
      ),
      initialRoute: RouteNames.root,
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
      const HomePageView(),
      const SearchPage(),
      const JobsPage(),
      const AccountPage(),
    ];

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 50),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text('Do you want to Exit?'),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
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
        bottomNavigationBar: const BottomNavBarConstraints(
          child: CustomBottomNavBar(),
        ),
      ),
    );
    // );
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
        leadingWidth: 200,
        leading: Container(
            alignment: Alignment.centerLeft,
            //  TODO : remove padding and center widget Portal txt
            padding: const EdgeInsets.only(top: 3),
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.donut_large_rounded,
                  color: Colors.black,
                  size: 20,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  "Portal",
                  style: kLogoTextStyle,
                )
              ],
            )),
        action: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(0, 10, 20, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    greeting()[0],
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
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
      onTap: onTap,
      child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: btnBgColor,
            boxShadow: const [kIconShadow],
          ),
          child: child),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final BottomNavBarController controller = Get.put(BottomNavBarController());
    return Container(
      margin: EdgeInsets.all(_width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
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
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == controller.selectedIndex.value
                        ? _width * 0.32
                        : _width * 0.18,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
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
                    duration: const Duration(seconds: 1),
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
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == controller.selectedIndex.value
                                  ? _width * 0.13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == controller.selectedIndex.value
                                  ? 1
                                  : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == controller.selectedIndex.value
                                    ? bottomNavBarLabels[index]
                                    : '',
                                style: const TextStyle(
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
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == controller.selectedIndex.value
                                  ? _width * 0.03
                                  : 20,
                            ),
                            Icon(
                              bottomNavBarIcons[index],
                              size: _width * 0.076,
                              color: index == controller.selectedIndex.value
                                  ? const Color.fromARGB(255, 255, 255, 255)
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

class RootPage extends GetWidget<AuthController> {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: const Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
    // return GetX(
    //   builder: (controller) {
    //     if (Get.find<UserAccountController>().user.user != null)
    //       return HomePage();
    //     else
    //       return LoginPage();
    //   },
    // );
  }
}
