import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_store.dart';

// タスクアイテムウィジェット
class TaskItem extends StatelessWidget {
  final String taskName;
  final int index;
  TaskItem(this.index, this.taskName);
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(
        builder: (BuildContext context, TaskStore taskStore, _) {
      return Card(
        color: Colors.blueAccent[100],
        child: new InkWell(
          onTap: () {
            taskStore.removeTask(index);
          },
          child: Padding(
            child: Text(taskName),
            padding: EdgeInsets.all(20.0),
          ),
        ),
      );
    });
  }
}
