import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_portal/components/homepage_searchbar.dart';
import 'package:job_portal/components/popular_jobs.dart';
import 'package:job_portal/components/recent_posts.dart';
import 'package:job_portal/components/searchbar.dart';
import 'package:job_portal/constants.dart';
import 'package:job_portal/routes/routes.dart';
import 'package:job_portal/view/search_page/search_page.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.sort),
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
              child: SearchBar(
                suffixIcon: IconButton(
                  icon: Icon(Icons.manage_search_rounded),
                  onPressed: () {
                    Get.toNamed(RouteNames.search);
                  },
                ),
              ),
            ),
            //Popular Job
            PopularJobs(),
            //Recent Post
            RecentPosts(),
          ],
        ),
      ),
    );
  }
}
