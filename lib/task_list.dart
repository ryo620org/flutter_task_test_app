import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_store.dart';
import 'task_item.dart';

// タスクリストウィジェット
class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(builder: (
      context,
      taskStore,
      _,
    ) {
      return ListView.builder(
        itemCount: taskStore.taskItems.length,
        itemBuilder: (BuildContext context, int index) {
          return TaskItem(index, taskStore.taskItems[index]);
        },
      );
    });
  }
}