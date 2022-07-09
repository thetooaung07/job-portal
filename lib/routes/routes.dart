import 'package:get/get.dart';
import 'package:job_portal/binding/searchpage_binding.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/view/account_page.dart';
import 'package:job_portal/view/applications_page.dart';
import 'package:job_portal/view/applied_page.dart';
import 'package:job_portal/view/login/signup_page.dart';
import 'package:job_portal/view/login/login_page.dart';
import 'package:job_portal/view/job_details_page.dart';
import 'package:job_portal/view/jobs_page.dart';
import 'package:job_portal/view/my_jobs_page.dart';
import 'package:job_portal/view/nearby_page.dart';
import 'package:job_portal/view/popular_jobs/popular_jobs_page.dart';
import 'package:job_portal/view/recent_posts/recent_posts_page.dart';
import 'package:job_portal/view/saved_jobs_page.dart';
import 'package:job_portal/view/search_page/search_page.dart';

class RouteNames {
  static String login = "/login";
  static String home = "/home";
  static String popularJobs = "/popular-jobs";
  static String recentPosts = "/recent-posts";
  static String search = "/search";
  static String jobDetails = "/job-details";
  static String jobs = "/jobs";
  static String applications = "/applications";
  static String myJobs = "/my-jobs";
  static String nearby = "/nearby";
  static String account = "/account";
  static String applied = "/applied";
  static String signup = "/signup";
  static String savePosts = "/saved-posts";
}

routes() => [
      GetPage(
        name: RouteNames.login,
        // binding: HomePageBinding(),
        page: () => const LoginPage(),
      ),
      GetPage(
        name: RouteNames.signup,
        // binding: HomePageBinding(),
        page: () => const SignUpPage(),
      ),
      GetPage(
        name: RouteNames.home,
        // binding: HomePageBinding(),
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
        binding: SearchPageBinding(),
        page: () => const SearchPage(),
      ),
      GetPage(
        name: RouteNames.jobDetails,
        page: () => const JobDetailsPage(),
      ),
      GetPage(
        name: RouteNames.jobs,
        page: () => const JobsPage(),
      ),
      GetPage(
        name: RouteNames.nearby,
        page: () => const NearbyPage(),
      ),
      GetPage(
        name: RouteNames.applied,
        page: () => const AppliedPage(),
      ),
      GetPage(
        name: RouteNames.account,
        page: () => const AccountPage(),
      ),
      GetPage(
        name: RouteNames.applications,
        page: () => const ApplicationsPage(),
      ),
      GetPage(
        name: RouteNames.myJobs,
        page: () => const MyJobsPage(),
      ),
      GetPage(
        name: RouteNames.savePosts,
        page: () => const SavedJobsPage(),
      ),
    ];
