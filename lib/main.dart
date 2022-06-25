import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: RouteNames.home,
      getPages: routes(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        CustomIconButton(
                          child: Icon(
                            Icons.notifications_none_rounded,
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
              //Search Bar
              // Padding(
              //   padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //   child: HomePageSearchBar(),
              // ),
              //Popular Job
              TopCompanyContainer(),
              //Recent Post
              SuggestedJobContainer(),
            ],
          ),
        ),
      ),
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
