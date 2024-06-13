import 'package:flutter/material.dart';
import 'package:myapp/pages/home/home.page.dart';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:sqflite/sqflite.dart';
import 'repositories/note/note.repository.dart';
import 'repositories/note/note.dart';

late NoteRepository noteRepository;

Future InitDB() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    Path.join(await getDatabasesPath(), 'doggie_database.db'),
  );
}

Future<Database> SetupTables() async {
  final database = openDatabase(
    Path.join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT)',
      );
    },
    version: 1,
  );

  return database;
}

Future<NoteRepository> SetupNoteRepository(Database database) async {
  return NoteRepository(database);
}

Future<Database> SetupDatabase() async {
  await InitDB();
  return await SetupTables();
}

void main() async {
  final database = await SetupDatabase();
  noteRepository = await SetupNoteRepository(database);
  runApp(const MyApp());
}

Future<List<Note>> CreateNoteAndRefreshList(Note note) async {
  await noteRepository.addNote(note);
  return await noteRepository.getNotes();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 200, 170, 0),
          onPrimary: Color.fromARGB(255, 200, 170, 0),
          secondary: Colors.orange,
          onSecondary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
          background: Colors.white,
          onBackground: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.light,

        ),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black, displayColor: Colors.white),
      ),

      home: (HomePage(noteRepository)),
    );
  } 
}