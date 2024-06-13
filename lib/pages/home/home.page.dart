import 'package:flutter/material.dart';
import 'package:myapp/pages/home/home.controller.dart';
import 'package:myapp/pages/home/home.view.dart';
import 'package:myapp/repositories/note/note.repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  late NoteRepository noteRepository;
  late HomeView view;
  late HomeController controller;



  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => controller, child: view);
  }

  HomePage(this.noteRepository) {
    controller = HomeController(noteRepository);
    view = HomeView(title: 'Notes');
  }
}