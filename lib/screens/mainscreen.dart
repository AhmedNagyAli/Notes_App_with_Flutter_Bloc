// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_type_check, prefer_typing_uninitialized_variables, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/debug/debug_page.dart';
import 'package:todoapp/notes/logic/bloc/notes_bloc.dart';
import 'package:todoapp/notes/pages/create.dart';
//import 'package:todolist/notes/pages/list.dart';
import 'package:todoapp/notes/pages/update.dart';
import 'package:todoapp/widgets/list_result_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var constraints;
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        const SizedBox(width: 10),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.black12)),
                        )),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    child: Text('اضافة '),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateNote()));
                    },
                  ),
                  ElevatedButton(
                    child: Text('debug '),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DebugPage()));
                    },
                  ),
                  BlocBuilder<NotesBloc, NotesState>(
                    builder: (context, state) {
                      if (state is NoteInitial) {
                        BlocProvider.of<NotesBloc>(context).add(NoteRetrieve());
                      } else if (state is NoteRetrieved) {
                        state.notes.map(
                            (distributor) => print(distributor.toString()));
                        return Expanded(
                          child: ListView(
                              children: state.notes
                                  .map<Widget>((note) => CResultCard(
                                        felids: [note.txt],
                                        actionButtonText: 'تحديث',
                                        onActionButtonPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateNote(note: note)));
                                        },
                                      ))
                                  .toList()),
                        );
                      } else if (state is NoteRetrieving) {
                        return const CircularProgressIndicator();
                      } else if (state is NotesState) {
                        return const CircularProgressIndicator();
                      } else if (state is NoteFault) {
                        return const Text('retrieving from database error');
                      }

                      return const Text('error');
                    },
                  ),
                ],
              ),
            ),
          )),
        );
      }),
    );
  }
}
