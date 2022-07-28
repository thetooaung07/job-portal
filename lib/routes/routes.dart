import 'package:get/get.dart';
import 'package:job_portal/main.dart';
import 'package:job_portal/view/account_page.dart';
import 'package:job_portal/view/applications_page.dart';

import 'package:job_portal/view/edit_profile.dart';
import 'package:job_portal/view/login/signup_page.dart';
import 'package:job_portal/view/login/login_page.dart';
import 'package:job_portal/view/job_details_page/job_details_page.dart';
import 'package:job_portal/view/jobs_page.dart';
import 'package:job_portal/view/my_jobs_page.dart';
import 'package:job_portal/view/nearby_page.dart';
import 'package:job_portal/view/popular_jobs/popular_jobs_page.dart';
import 'package:job_portal/view/post_job_page.dart';
import 'package:job_portal/view/recent_posts/recent_posts_page.dart';
import 'package:job_portal/view/saved_jobs_page.dart';
import 'package:job_portal/view/search_page/search_page.dart';
import 'package:job_portal/view/show_applicants.dart';

class RouteNames {
  static String root = "/root";
  static String login = "/login";
  static String home = "/home";
  static String search = "/search";
  static String popularJobs = "/popular-jobs";
  static String recentPosts = "/recent-posts";
  static String jobDetails = "/job-details";
  static String jobs = "/jobs";
  static String applications = "/applications";
  static String myJobs = "/my-jobs";
  static String nearby = "/nearby";
  static String account = "/account";
  static String applied = "/applied";
  static String signup = "/signup";
  static String savePosts = "/saved-posts";
  static String postJob = "/post-job";
  static String eidtProfile = "/edit-profile";
  static String showApplicants = "/show-applicants";
}

routes() => [
      GetPage(name: RouteNames.root, page: () => const RootPage()),
      GetPage(name: RouteNames.login, page: () => const LoginPage()),
      GetPage(name: RouteNames.signup, page: () => const SignUpPage()),
      GetPage(name: RouteNames.home, page: () => const HomePage()),
      GetPage(
          name: RouteNames.popularJobs, page: () => const PopularJobsPage()),
      GetPage(
          name: RouteNames.recentPosts, page: () => const RecentPostsPage()),
      GetPage(name: RouteNames.search, page: () => const SearchPage()),
      GetPage(name: RouteNames.jobDetails, page: () => const JobDetailsPage()),
      GetPage(name: RouteNames.jobs, page: () => const JobsPage()),
      GetPage(name: RouteNames.nearby, page: () => const NearbyPage()),
      GetPage(name: RouteNames.applied, page: () => const JobsPage()),
      GetPage(name: RouteNames.account, page: () => const AccountPage()),
      GetPage(
          name: RouteNames.applications, page: () => const ApplicationsPage()),
      GetPage(name: RouteNames.myJobs, page: () => const MyJobsPage()),
      GetPage(name: RouteNames.savePosts, page: () => const SavedJobsPage()),
      GetPage(name: RouteNames.postJob, page: () => const PostJobPage()),
      GetPage(name: RouteNames.eidtProfile, page: () => EditProfilePage()),
      GetPage(
          name: RouteNames.showApplicants, page: () => ShowApplicantsPage()),
    ];
