// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/notes/pages/list.dart';
//import 'package:todolist/debug/debug_page.dart';
//import 'package:todolist/notes/pages/index.dart';
//import 'package:todolist/screens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notes app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Notes App'))),
      body: ListNotes(),
    );
  }
}
