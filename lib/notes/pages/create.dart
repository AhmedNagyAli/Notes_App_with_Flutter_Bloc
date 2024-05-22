// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/database/models/notes.dart';
import 'package:todoapp/notes/logic/bloc/notes_bloc.dart';
import 'package:todoapp/widgets/text_field.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});
  TextEditingController txtTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('notes'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              CTextFelid(hint: 'search', tec: txtTec),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  if (state is NoteInitial) {
                    return Text('');
                  } else if (state is NoteCreating) {
                    return CircularProgressIndicator();
                  } else if (state is NoteCreated) {
                    return Icon(Icons.check);
                  } else if (state is NoteFault) {
                    List<Text> errors = [];
                    if (txtTec.text.isEmpty) {
                      errors.add(Text(
                          style: TextStyle(color: Colors.red), 'Create Note'));
                    }

                    return Center(child: Column(children: errors));
                  }
                  return Text(state.toString());
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<NotesBloc>(context).add(NoteCreate(Note(
                      txt: txtTec.text,
                    )));
                  },
                  child: const Text('create note ')),
            ],
          ),
        );
      }),
    );
  }
}
