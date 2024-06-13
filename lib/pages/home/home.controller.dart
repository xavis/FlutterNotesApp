import 'package:flutter/widgets.dart';
import 'package:myapp/repositories/note/note.repository.dart';

import '../../repositories/note/note.dart';

class HomeController with ChangeNotifier {
  
  NoteRepository noteRepository;
  List<Note> notes = [];

  Future<void> getNotes() async {
      List<Note> notesList = await noteRepository.getNotes();
      notes = notesList;
      notifyListeners();
  }

  CreateNote(Note note) async {
    await noteRepository.addNote(note);
  }

  CreateNoteAndRefreshList(String _title, String _content) async {
    Note note = Note(title: _title, content: _content);
    await CreateNote(note);
    await getNotes();
  }

  HomeController(this.noteRepository) {
    getNotes();
  }

}