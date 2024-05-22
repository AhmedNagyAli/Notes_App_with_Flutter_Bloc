// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class CSearchFelid extends StatefulWidget {
  CSearchFelid({
    super.key,
    required this.hint,
    required this.tec,
    required this.onSearchButtonPressed,
    required InputDecoration decoration,
  });
  String hint;
  TextEditingController tec;
  dynamic onSearchButtonPressed;

  @override
  State<CSearchFelid> createState() => _CSearchFelidState();
}

class _CSearchFelidState extends State<CSearchFelid> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) => widget.onSearchButtonPressed(),
      controller: widget.tec,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        labelText: widget.hint,
        suffixIcon: IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: widget.onSearchButtonPressed),
        border: OutlineInputBorder(),
      ),
    );
  }
}
