import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/view/app_drawer.dart';
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
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: kPrimaryRedColor),
      ),
      initialRoute: RouteNames.home,
      getPages: routes(),
    );
  }
}

//  isDrawerOpen
//               ? IconButton(
//                   icon: Icon(
//                     Icons.chevron_left,
//                     size: 35,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       xOffset = 0;
//                       yOffset = 0;
//                       scaleFactor = 1;
//                       isDrawerOpen = false;
//                     });
//                   },
//                 )
//               : IconButton(
//                   icon: Icon(Icons.sort),
//                   onPressed: () {
//                     setState(() {
//                       xOffset = 230;
//                       yOffset = 150;
//                       scaleFactor = 0.6;
//                       isDrawerOpen = true;
//                     });
//                   },
//                 ),

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: themeBgMainColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               MyAppBar(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Obx(
//                           () => CustomIconButton(
//                             onTap: () {
//                               xOffset.value = 0;
//                               yOffset.value = 0;
//                               scaleFactor.value = 1;
//                               isDrawerOpen.value = false;
//                             },
//                             child: Icon(
//                               Icons.clear_all,
//                               size: 30,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "QWERTY",
//                           style: kLogoTextStyle,
//                         ),
//                         CustomIconButton(
//                           onTap: (() => Get.toNamed(RouteNames.search)),
//                           child: Icon(
//                             Icons.search_rounded,
//                             size: 30,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ]),
//                 ),
//               ),
//               //Search Bar
//               // Padding(
//               //   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
//               //   child: HomePageSearchBar(),
//               // ),
//               //Popular Job
//               TopCompanyContainer(),
//               //Recent Post
//               SuggestedJobContainer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    double _width = Get.width;
    RxDouble xOffset = 0.0.obs;
    RxDouble yOffset = 0.0.obs;
    RxDouble scaleFactor = 1.0.obs;
    RxBool isDrawerOpen = false.obs;
    RxInt currentIndex = 0.obs;
    return Obx(
      () => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        transform: Matrix4.translationValues(xOffset.value, yOffset.value, 0)
          ..scale(scaleFactor.value),
        child: Scaffold(
          backgroundColor: themeBgMainColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyAppBar(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            isDrawerOpen.value
                                ? CustomIconButton(
                                    onTap: () {
                                      xOffset.value = 0;
                                      yOffset.value = 0;
                                      scaleFactor.value = 1;
                                      isDrawerOpen.value = false;
                                    },
                                    child: Icon(
                                      Icons.clear_all,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                  )
                                : CustomIconButton(
                                    onTap: () {
                                      xOffset.value = 230;
                                      yOffset.value = 150;
                                      scaleFactor.value = 0.6;
                                      isDrawerOpen.value = true;
                                    },
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
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(_width * 0.05),
            height: _width * 0.155,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  currentIndex.value = index;
                  print(currentIndex.value);
                  HapticFeedback.lightImpact();
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
                        width: index == currentIndex.value
                            ? _width * 0.32
                            : _width * 0.18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height:
                              index == currentIndex.value ? _width * 0.12 : 0,
                          width:
                              index == currentIndex.value ? _width * 0.32 : 0,
                          decoration: BoxDecoration(
                            color: index == currentIndex.value
                                ? kPrimaryRedColor.withOpacity(.1)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == currentIndex.value
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
                                  width: index == currentIndex.value
                                      ? _width * 0.13
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index == currentIndex.value ? 1 : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == currentIndex.value
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
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index == currentIndex.value
                                      ? _width * 0.03
                                      : 20,
                                ),
                                Icon(
                                  bottomNavBarIcons[index],
                                  size: _width * 0.076,
                                  color: index == currentIndex.value
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: Colors.black,
              ),
              // Text(
              //   "Home",
              //   style: TextStyle(
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class BaseWrapper extends StatelessWidget {
  const BaseWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppDrawer(),
          HomePage(),
        ],
      ),
    );
  }
}



 // bottomNavigationBar: Container(
          //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //   height: 60,
          //   decoration: BoxDecoration(
          //     color: jobDetailsTabBgColor,
          //     borderRadius: BorderRadius.circular(50),
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 12),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         NavItem(),
          //         NavItem(),
          //         NavItem(),
          //         NavItem(),
          //       ],
          //     ),
          //   ),
          // ),