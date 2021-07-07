import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              //here Provider.of<TaskData>(context) is replaced by taskData
              isChecked: taskItem.isDone,
              longPressCallback: () {
                taskData.DeleteTask(taskItem);
              },
              taskTitle: taskItem.name,
              checkBoxCallback: (currentCheckBoxState) {
                taskData.UpdateTask(taskItem);
                // Provider.of<TaskData>(context).tasks[index].toggleDone();
              },
            );
          },
        );
      },
    );
  }
}
