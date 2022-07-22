import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();

  TasksList(this.tasks);
  List<Task> tasks;
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkBoxCallback: (bool? checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
