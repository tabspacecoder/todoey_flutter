import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy egg'),
    Task(name: 'Buy jam'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newtask) {
    _tasks.add(Task(name: newtask));
    notifyListeners();
  }

  void UpdateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void DeleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
