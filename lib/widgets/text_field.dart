// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CTextFelid extends StatelessWidget {
  CTextFelid({super.key, required this.hint, required this.tec});
  String hint;
  TextEditingController tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
