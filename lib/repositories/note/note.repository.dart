import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'note.dart';

class NoteRepository { //uses sqlite

  final Database database;

  Future<List<Note>> getNotes() async {
    // get all notes from sqlite
    List<Map<String, dynamic>> notes = await database.query('notes');
    return notes.map((note) => Note(
      id: note['id'],
      title: note['title'],
      content: note['content']
    )).toList();
  }

  Future<Note> getNoteById(int id) async {
    // get note by id from sqlite
    List<Map<String, dynamic>> notes = await database.query('notes', where: 'id = ?', whereArgs: [id]);
    return notes.map((note) => Note(
      id: note['id'],
      title: note['title'],
      content: note['content']
    )).first;
  }

  Future<void> addNote(Note note) async {
    // add note to sqlite
    await database.insert('notes', {
      'title': note.title,
      'content': note.content,
    });
  }

  Future<void> updateNote(Note note) async {
    // update note in sqlite
    await database.update('notes', {
      'title': note.title,
      'content': note.content,
    }, where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deleteNoteById(int id) async {
    // delete note by id from sqlite
    await database.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  const NoteRepository(this.database);
}