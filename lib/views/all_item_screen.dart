import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/providers/todo_provider.dart';
import 'package:testapp/views/task_item.dart';

class AllItemScreen extends StatefulWidget {
  const AllItemScreen({Key? key}) : super(key: key);

  @override
  State<AllItemScreen> createState() => _AllItemScreenState();
}

class _AllItemScreenState extends State<AllItemScreen> {
  @override
  Widget build(BuildContext context) {
    if(Provider.of<TodoProvider>(context).itemList.isEmpty) {
      return const Center(child: Text('You have no tasks yet - Start Adding some!'),);
    }else {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return TaskItem(
                value: Provider.of<TodoProvider>(context).itemList[index].isCheck,
                onChange: (bool? newValue) {
                  Provider.of<TodoProvider>(context, listen: false)
                      .isCheck(newValue!, index);
                },
                title:
                '${Provider.of<TodoProvider>(context).itemList[index].title}',
                onTap: () => Provider.of<TodoProvider>(context, listen: false)
                    .removeFromList(index),
              );
            },
            itemCount: Provider.of<TodoProvider>(context).getLength,
          ));
    }
  }
}
