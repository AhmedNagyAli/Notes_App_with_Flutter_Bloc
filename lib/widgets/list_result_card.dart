// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class CResultCard extends StatelessWidget {
  CResultCard(
      {super.key,
      required this.felids,
      required this.onActionButtonPressed,
      required this.actionButtonText});
  List<String> felids;
  dynamic onActionButtonPressed;
  String actionButtonText;
  @override
  Widget build(BuildContext context) {
    List<Widget> cardItems = [];

    cardItems.add(ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green[400]),
        onPressed: onActionButtonPressed,
        child: Text(actionButtonText)));

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
