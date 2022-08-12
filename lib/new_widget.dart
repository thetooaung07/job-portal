// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class OrderedList extends StatelessWidget {
  const OrderedList(this.texts);
  final List<dynamic> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    int counter = 0;
    for (var text in texts) {
      // Add list item
      counter++;
      widgetList.add(OrderedListItem(counter, text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class OrderedListItem extends StatelessWidget {
  const OrderedListItem(this.counter, this.text);
  final int counter;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$counter. "),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}

/* Usage =>  UnorderedList([
    "What conclusions can we draw from the implementation?",
    "Are there any changes that need to be introduced permanently?"
])
 */

class UnorderedList extends StatelessWidget {
  const UnorderedList(this.texts);
  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var text in texts) {
      // Add list item
      widgetList.add(UnorderedListItem(text));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}
