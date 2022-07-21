import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool? isChecked = false;

  void checkboxCallBack(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: isChecked ?? false ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckBox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallBack,
      ),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({this.checkboxState, this.toggleCheckboxState});
  final bool? checkboxState;
  final Function(bool?)? toggleCheckboxState;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
