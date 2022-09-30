import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal/constants.dart';

const List dropdownItemList = [
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
    return SingleChildScrollView(
      child: Container(
        width: Get.width,
        height: Get.height * 0.85,
        decoration: const BoxDecoration(
          color: themeBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
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
              Align(
                child: Container(
                  width: 50,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filters",
                      style: kHeaderTextStyle.copyWith(letterSpacing: 1),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Reset",
                        style: kLabelTextStyle.copyWith(
                            color: kPrimaryRedColor, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              const LabelDropDownBtn(
                label: "Job Categories",
              ),
              const LabelDropDownBtn(
                label: "Job Type",
              ),
              const LabelDropDownBtn(label: "Location"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Salary",
                      style: kLabelTextStyle.copyWith(fontSize: 17),
                    ),
                    DropdownButton(
                      underline: const SizedBox(),
                      value: "a",
                      items: const [
                        DropdownMenuItem(value: "a", child: Text("Month")),
                        DropdownMenuItem(value: "b", child: Text("Year"))
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelDropDownBtn(
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 5),
                        child: Text(
                          "Min. Salary",
                          style: kBulletListTextStyle.copyWith(
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LabelDropDownBtn(
                        padding: EdgeInsets.only(right: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Max. Salary",
                          style: kBulletListTextStyle.copyWith(
                              color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(15),
                width: Get.width,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {},
                    child: Text(
                      "Show Results",
                      style: kLabelTextStyle.copyWith(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class OutlineBtnBubble extends StatelessWidget {
//   final String? title;

//   const OutlineBtnBubble({Key? key, this.title = "Hello"}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       decoration: BoxDecoration(
//         color: kPrimaryRedColor,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Text(
//         title!,
//         style: kLabelTextStyle.copyWith(
//             color: Colors.white, fontWeight: FontWeight.normal),
//       ),
//     );
//   }
// }

class LabelDropDownBtn extends StatelessWidget {
  final String? label;
  final EdgeInsetsGeometry? padding;
  const LabelDropDownBtn({
    Key? key,
    this.label = "",
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxString selectedItem = "Flutter".obs;

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label != ""
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    label ?? "",
                    style: kLabelTextStyle.copyWith(fontSize: 17),
                  ),
                )
              : const SizedBox(
                  height: 1,
                ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Obx(
              () => DropdownButton(
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 42,
                underline: const SizedBox(),
                dropdownColor: Colors.white,
                value: selectedItem.value,
                isExpanded: true,
                focusColor: Colors.red,
                hint: const Text("UI / UX Designer"),
                onChanged: (v) {
                  selectedItem.value = v.toString();
                },
                items: dropdownItemList
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text("$item"),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
