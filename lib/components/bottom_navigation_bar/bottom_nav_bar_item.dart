import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  final String label;
  final Icon icon;
  final int id;
  final int selectedIndex;
  final Function() onPressed;

  const BottomNavBarItem(
      {Key? key,
      required this.label,
      required this.icon,
      required this.id,
      required this.selectedIndex,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: selectedIndex == id ? Colors.teal : Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            Text(label),
          ],
        ),
      ),
    );
  }
}
