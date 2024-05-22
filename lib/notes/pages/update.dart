// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/database/models/notes.dart';
import 'package:todoapp/notes/logic/bloc/notes_bloc.dart';
import 'package:todoapp/widgets/text_field.dart';

class UpdateNote extends StatefulWidget {
  UpdateNote({super.key, required this.note});

  Note note;

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  TextEditingController txtTec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    txtTec.text = widget.note.txt;
    return BlocProvider(
      create: (context) => NotesBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('تعديل'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              CTextFelid(hint: 'الاسم', tec: txtTec),
              BlocBuilder<NotesBloc, NotesState>(
                builder: (context, state) {
                  if (state is NoteInitial) {
                    return Text('');
                  } else if (state is NoteUpdating) {
                    return CircularProgressIndicator();
                  } else if (state is NoteUpdated) {
                    return Icon(Icons.check);
                  } else if (state is NoteFault) {
                    List<Text> errors = [];
                    if (txtTec.text.isEmpty) {
                      errors.add(
                          Text(style: TextStyle(color: Colors.red), 'ادخل'));
                    }

                    print('update fault');
                    return Center(child: Column(children: errors));
                  }
                  return Text(state.toString());
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Note newNote = Note(
                      txt: txtTec.text,
                    );
                    BlocProvider.of<NotesBloc>(context).add(
                      NoteUpdate(id: widget.note.id, newNote: newNote),
                    );
                  },
                  child: const Text('حفظ')),
            ],
          ),
        );
      }),
    );
  }
}
