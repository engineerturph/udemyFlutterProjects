import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  bool? isChecked = false;
  final String? taskTitle;
  final Function(bool?)? checkBoxCallback;

  TaskTile(
      {this.isChecked,
      required this.taskTitle,
      required this.checkBoxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isChecked ?? false ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
        // onChanged: toggleCheckboxState,
      ),
    );
  }
}
