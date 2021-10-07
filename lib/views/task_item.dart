import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final bool? value;
  final Function(bool?)? onChange;
  final String? title;
  final Function()? onTap;

  const TaskItem({
    Key? key,
    required this.value,
    required this.onChange,
    required this.title,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Checkbox(
            value: value,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(Colors.blue),
            onChanged: onChange!,
          ),
          title: Text(title!),
          trailing: InkWell(
            onTap: onTap,
            child: const Icon(Icons.delete, color: Colors.red),
          ),
    );
  }
}