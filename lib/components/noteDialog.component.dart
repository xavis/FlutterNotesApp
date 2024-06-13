import 'package:flutter/material.dart';

class NoteDialog extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final Function(String, String) onSave;

  NoteDialog(this.titleController, this.contentController, this.onSave);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Note'),
      content: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: contentController,
            decoration: const InputDecoration(labelText: 'Content'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onSave(titleController.text, contentController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}