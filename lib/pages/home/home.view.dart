import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/note.component.dart';
import '../../components/noteDialog.component.dart';
import 'home.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

    void onSave(String title, String content) async {
      await controller.CreateNoteAndRefreshList(title, content);
    }

    _openNewNotePopup() {

    String title = '';
    String content = '';

    final titleController = TextEditingController(text: title);
    final contentController = TextEditingController(text: content);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NoteDialog(titleController, contentController, onSave);
      },
    );
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium)
    ),
    body: Center(
      child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Padding(padding: EdgeInsets.all(5)),
      itemBuilder: (BuildContext context, int index) {
        return NoteComponent(controller.notes[index]);
      },
      itemCount: controller.notes.length,
    ),
  ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewNotePopup,
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Colors.white),
      ), 
    );
  }
}
