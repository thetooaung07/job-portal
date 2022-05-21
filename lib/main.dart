import 'package:flutter/material.dart';
import 'package:job_portal/components/homepage_searchbar.dart';
import 'package:job_portal/components/popular_jobs.dart';
import 'package:job_portal/components/searchbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
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
        actions: const [Icon(Icons.person)],
      ),
      body: Column(
        children: const [
          //Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
            child: HomePageSearchBar(),
          ),
          //Popular Job
          PopularJobs(),
          //Recent Post
        ],
      ),
    );
  }
}
