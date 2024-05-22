// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/notes/pages/create.dart';
import 'package:todoapp/notes/pages/list.dart';

class IndexNote extends StatelessWidget {
  const IndexNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('notes'),
          centerTitle: true,
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(constraints.maxWidth - 100, 150)),
                    child: Text('اضافة '),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNote()));
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(constraints.maxWidth - 100, 150)),
                    child: Text('notes'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ListNotes()));
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
