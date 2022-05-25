import 'package:get/get.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/view/job_details_page.dart';
import 'package:job_portal/view/popular_jobs/popular_jobs_page.dart';
import 'package:job_portal/view/recent_posts/recent_posts_page.dart';
import 'package:job_portal/view/search_page/search_page.dart';

class RouteNames {
  static String home = "/home";
  static String popularJobs = "/popular-jobs";
  static String recentPosts = "/recent-posts";
  static String search = "/search";
  static String jobDetails = "/job-details";
}

routes() => [
      GetPage(
        name: RouteNames.home,
        page: () => const HomePage(),
      ),
      GetPage(
        name: RouteNames.popularJobs,
        page: () => const PopularJobsPage(),
      ),
      GetPage(
        name: RouteNames.recentPosts,
        page: () => const RecentPostsPage(),
      ),
      GetPage(
        name: RouteNames.search,
        page: () => const SearchPage(),
      ),
      GetPage(
        name: RouteNames.jobDetails,
        page: () => const JobDetailsPage(),
      ),
    ];
