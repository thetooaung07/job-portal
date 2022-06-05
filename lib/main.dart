import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/widgets/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:job_portal/widgets/homepage_searchbar.dart';
import 'package:job_portal/widgets/popular-jobs-container.dart';
import 'package:job_portal/widgets/recent-posts.container.dart';
import 'package:job_portal/controller/bottom_nav_bar_controller.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/view/app_drawer.dart';
import 'package:job_portal/view/jobs_page.dart';
import 'package:job_portal/view/notifications_page.dart';
import 'package:job_portal/view/profile_page.dart';

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
        // scaffoldBackgroundColor: Color.fromRGBO(251, 251, 251, 1),
        // appBarTheme: AppBarTheme(
        //   textTheme: Theme.of(context).textTheme.apply(
        //         bodyColor: const Color(0xff22215B),
        //         displayColor: const Color(0xff22215B),
        //       ),
        // ),
        // textTheme: Theme.of(context).textTheme.apply(
        //       bodyColor: Colors.white,
        //       displayColor: Colors.yellow,
        //     ),
        primarySwatch: Colors.teal,
      ),
      initialRoute: RouteNames.home,
      getPages: routes(),
    );
  }
}

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({Key? key}) : super(key: key);

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  int selectedIndex = 1;
  final BottomNavBarController _controller = Get.put(BottomNavBarController());

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      child: Scaffold(
        appBar: AppBar(
          leading: isDrawerOpen
              ? IconButton(
                  icon: Icon(
                    Icons.chevron_left,
                    size: 35,
                  ),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.sort),
                  onPressed: () {
                    setState(() {
                      xOffset = 230;
                      yOffset = 150;
                      scaleFactor = 0.6;
                      isDrawerOpen = true;
                    });
                  },
                ),
          actions: const [
            Icon(Icons.person),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: HomePage(),
        // body: PageView(
        //   children: [
        //     HomePage(),
        //     JobsPage(),
        //     NotificationsPage(),
        //     ProfilePage(),
        //   ],
        //   controller: _controller.pageController,
        //   physics: NeverScrollableScrollPhysics(),
        //   onPageChanged: (value) {
        //     _controller.onPageChange(value);
        //   },
        // ),
        // bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Search Bar
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: HomePageSearchBar()),
          //Popular Job
          PopularJobsContainer(),
          //Recent Post
          RecentPostsContainer(),
        ],
      ),
    );
  }
}

class BaseWrapper extends StatefulWidget {
  const BaseWrapper({Key? key}) : super(key: key);

  @override
  State<BaseWrapper> createState() => _BaseWrapperState();
}

class _BaseWrapperState extends State<BaseWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppDrawer(),
          HomePageWrapper(),
        ],
      ),
    );
  }
}
