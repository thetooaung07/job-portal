import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search for Jobs',
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            'assets/icons/slider_icon.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
