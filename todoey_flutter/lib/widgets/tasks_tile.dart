import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class TaskTile extends StatelessWidget {
  @override
  int index;

  TaskTile({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        context.watch<TaskModel>().tasks[index].name!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: context.watch<TaskModel>().tasks[index].isDone
              ? TextDecoration.lineThrough
              : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: context.watch<TaskModel>().tasks[index].isDone,
        onChanged: (bool? checkboxState) {
          context.read<TaskModel>().toggleDone(index);
        },
        // onChanged: toggleCheckboxState,
      ),
    );
  }
}
