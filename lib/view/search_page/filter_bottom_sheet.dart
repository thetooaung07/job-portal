import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';

const List DropdownItemList = [
  "UI/UX",
  "Graphic Designer",
  "Web Developer",
  "Android Developer",
  "IOS Developer",
  "Flutter"
];

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.8,
      decoration: BoxDecoration(
        color: kBgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Set Filters",
                style: kHeaderTextStyle,
              ),
            ),
            Align(
              child: Container(
                width: 100,
                height: 3,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            LabelDropDownBtn(
              label: "Category",
            ),
            LabelDropDownBtn(
              label: "Sub-Category",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: LabelDropDownBtn(label: "City")),
                SizedBox(
                  width: 20,
                ),
                Flexible(child: LabelDropDownBtn(label: "Salary")),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Job Type",
                style: kTitleTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                child: Wrap(
                  // runAlignment: WrapAlignment.start,
                  // alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    OutlineBtnBubble(),
                    OutlineBtnBubble(),
                    OutlineBtnBubble(),
                    OutlineBtnBubble(),
                    OutlineBtnBubble(),
                    OutlineBtnBubble(),
                    TextButton(
                      child: Text("Show All Type"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(color: Colors.teal),
                child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Apply Filters",
                      style: kTitleTextStyle.copyWith(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}

class OutlineBtnBubble extends StatelessWidget {
  final String? title;

  const OutlineBtnBubble({Key? key, this.title = "Hello"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title!,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class LabelDropDownBtn extends StatelessWidget {
  final String label;
  const LabelDropDownBtn({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString selectedItem = "Flutter".obs;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              label,
              style: kTitleTextStyle,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Obx(
              () => DropdownButton(
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 42,
                underline: SizedBox(),
                dropdownColor: Colors.white,
                value: selectedItem.value,
                isExpanded: true,
                focusColor: Colors.red,
                hint: Text("UI / UX Designer"),
                onChanged: (v) {
                  selectedItem.value = v.toString();
                },
                items: DropdownItemList.map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text("$item"),
                  ),
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
