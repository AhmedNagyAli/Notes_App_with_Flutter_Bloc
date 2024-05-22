// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/database/config.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  Database? connection;

  @override
  Widget build(BuildContext context) {
    DBConfig.getConnection().then((value) => connection = value);

    return Scaffold(
        appBar: AppBar(
          title: Text('debug'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(children: [
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  DBConfig.initDB();
                  setState(() {
                    DBConfig.getConnection()
                        .then((value) => connection = value);
                  });
                },
                child: Text('init database')),
            Spacer(),
            ElevatedButton(
                onPressed: () {
                  DBConfig.deleteDB();
                  setState(() {
                    DBConfig.getConnection()
                        .then((value) => connection = value);
                  });
                },
                child: Text('delete database')),
            Spacer(),
          ]),
        ));
  }
}
