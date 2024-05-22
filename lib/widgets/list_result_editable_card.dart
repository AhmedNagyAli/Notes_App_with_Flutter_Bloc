// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class CEditableResultCard extends StatelessWidget {
  CEditableResultCard(
      {super.key, required this.felids, required this.resultValueTce});
  List<String> felids;
  TextEditingController resultValueTce;
  @override
  Widget build(BuildContext context) {
    List<Widget> cardItems = [];

    cardItems.add(
      Expanded(
        child: TextFormField(
          controller: resultValueTce,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );

    for (var felid in felids) {
      cardItems.add(Spacer());
      cardItems.add(Text(felid));
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(children: cardItems),
    );
  }
}
