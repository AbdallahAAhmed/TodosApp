import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/providers/todo_provider.dart';

class AddScreen extends StatelessWidget {
  static const String routeName = 'add_screen';
  final textController = TextEditingController();

  AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autofocus: true,
              controller: textController,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).addToList(textController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
