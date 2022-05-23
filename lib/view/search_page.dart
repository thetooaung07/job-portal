import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_portal/constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: SearchBar(),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/icons/slider_icon.svg',
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Color.fromARGB(162, 0, 0, 0),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: "search job",
        hintStyle: TextStyle(
          color: Color.fromARGB(111, 0, 0, 0),
        ),
        filled: true,
        fillColor: kSilverColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            )),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            )),
        // errorBorder: InputBorder.none,
        // disabledBorder: InputBorder.none,
      ),
    );
  }
}




//To change the Input UI you need to define both enableBorder and border and focusBorder
