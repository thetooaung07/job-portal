import 'package:get/get.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/view/popular_jobs_page.dart';
import 'package:job_portal/view/recent_posts_page.dart';

class RouteNames {
  static String home = "/home";
  static String popularJobs = "/popular-jobs";
  static String recentPosts = "/recent-posts";
}

routes() => [
      GetPage(
        name: RouteNames.home,
        page: () => HomePage(),
      ),
      GetPage(
        name: RouteNames.popularJobs,
        page: () => const PopularJobsPage(),
      ),
      GetPage(
        name: RouteNames.recentPosts,
        page: () => RecentPostsPage(),
      ),
    ];
