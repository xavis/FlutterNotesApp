import 'package:flutter/material.dart';
import '../repositories/note/note.dart';

class NoteComponent extends StatelessWidget {
  final Note note;


  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(child: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left)),
              Container(child: Text(note.content, style: const TextStyle(fontWeight: FontWeight.normal), textAlign: TextAlign.left))
            ],
          )),
        );
  }

  const NoteComponent(this.note);
}