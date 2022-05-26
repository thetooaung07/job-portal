import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/homepage_searchbar.dart';
import 'package:job_portal/components/popular_jobs.dart';
import 'package:job_portal/components/recent_posts.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/view/app_drawer.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Search Bar
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: HomePageSearchBar()),
              //Popular Job
              PopularJobs(),
              //Recent Post
              RecentPosts(),
            ],
          ),
        ),
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
          HomePage(),
        ],
      ),
    );
  }
}
