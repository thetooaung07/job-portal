import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

//TODO: Use SilverDeligateAppBar for better UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apple Inc"),
        backgroundColor: kBgColor,
        foregroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Company Logo
                CompanyLogo(),
                // 3 Column Row
                AboutJob(),
                //Responsibilites
                Responsibilities(),
                // Qualifications
                Qualifications(),

                //ApplyNowBtn
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              "Apply Now",
                              style: kTitleTextStyle.copyWith(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: kSilverColor,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.teal, width: 2)),
                            child: Icon(Icons.bookmark_border_rounded)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutJob extends StatelessWidget {
  const AboutJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text("85,000.00")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text("USA")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Posts",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text("5")
            ],
          ),
        ],
      ),
    );
  }
}

class CompanyLogo extends StatelessWidget {
  const CompanyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            width: 100,
            height: 100,
            decoration: BoxDecoration(color: Colors.teal),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 5),
            child: Text(
              "Apple Inc",
            ),
          ),
          Text("Singapore, Contract"),
        ],
      ),
    );
  }
}

class Responsibilities extends StatelessWidget {
  const Responsibilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Responsibilities",
            style: kTitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
      ],
    );
  }
}

class Qualifications extends StatelessWidget {
  const Qualifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Minimum Qualifications",
            style: kTitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
              "Works effectively blah Blah and Dlutter is really good blah and Lorem Ipsum Askman Thether "),
        ),
      ],
    );
  }
}
