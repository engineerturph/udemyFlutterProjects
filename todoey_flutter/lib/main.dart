import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'models/task.dart';

class TaskModel extends ChangeNotifier {
  List<Task> _tasks = [Task(name: 'xd')];

  List<Task> get tasks => _tasks;

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskModel(),
      child: MyApp(),
      lazy: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
