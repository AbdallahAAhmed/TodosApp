import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/providers/todo_provider.dart';
import 'package:testapp/models/task.dart';
import 'package:testapp/views/task_item.dart';

class CompleteItemScreen extends StatelessWidget {
  const CompleteItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool checked = true;
    List<Task> inCompeteList = Provider.of<TodoProvider>(context).itemList.where((task){
      return task.isCheck == checked;
    }).toList();
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return TaskItem(
          value: inCompeteList[index].isCheck!,
          onChange: (bool? newValue) {
            Provider.of<TodoProvider>(context, listen: false)
                .isCheck(newValue!, index);
          },
          title:
          '${inCompeteList[index].title}',
          onTap: () => Provider.of<TodoProvider>(context, listen: false)
              .removeFromList(index),
        );
      },
      itemCount: inCompeteList.length,
    );
  }
}
