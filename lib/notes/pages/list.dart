// ignore_for_file: unnecessary_type_check, prefer_const_constructors, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/debug/debug_page.dart';
//import 'package:todolist/database/models/notes.dart';
import 'package:todoapp/notes/logic/bloc/notes_bloc.dart';
import 'package:todoapp/notes/pages/create.dart';
import 'package:todoapp/notes/pages/update.dart';
import 'package:todoapp/widgets/list_result_card.dart';
import 'package:todoapp/widgets/search_field.dart';
//import 'package:todolist/widgets/text_field.dart';

class ListNotes extends StatefulWidget {
  ListNotes({super.key});

  @override
  State<ListNotes> createState() => _ListNotesState();
}

class _ListNotesState extends State<ListNotes> {
  TextEditingController searchTec = TextEditingController();
  TextEditingController txtTec = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Builder(
        builder: (context) {
          //var constraints;
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 70),
                        padding: EdgeInsets.all(20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DebugPage()));
                    },
                    child: Text('Debug')),
                SizedBox(height: 30),
                //CTextFelid(hint: 'search', tec: txtTec),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(350, 70), padding: EdgeInsets.all(20)),
                  child: Text('create note'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateNote()));
                  },
                ),
                SizedBox(height: 10),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 194, 169, 169),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      //Icon(Icons.search),
                      //const SizedBox(width: 10),
                      Expanded(
                          child: CSearchFelid(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(40)),
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(31, 66, 14, 112))),
                        hint: 'search',
                        tec: searchTec,
                        onSearchButtonPressed: () {
                          BlocProvider.of<NotesBloc>(context)
                              .add(NoteSearch(query: searchTec.text));
                        },
                      )),
                    ],
                  ),
                ),

                BlocBuilder<NotesBloc, NotesState>(
                  builder: (context, state) {
                    if (state is NoteInitial) {
                      BlocProvider.of<NotesBloc>(context).add(NoteRetrieve());
                    } else if (state is NoteRetrieved) {
                      state.notes
                          .map((distributor) => print(distributor.toString()));
                      return Expanded(
                        child: Container(
                          //height: 130,
                          //width: 380,

                          child: ListView(
                              children: state.notes
                                  .map<Widget>(
                                    (note) => Container(
                                      height: 100,
                                      //padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 252, 251, 251),
                                            Color.fromARGB(255, 247, 247, 235)
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                      ),
                                      child: CResultCard(
                                        felids: [note.txt],
                                        actionButtonText: 'تحديث',
                                        onActionButtonPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateNote(note: note)));
                                        },
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ),
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
          );
        },
      ),
    );
  }
}
