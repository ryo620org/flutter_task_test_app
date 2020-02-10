import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task_list.dart';
import 'task_store.dart';

// ページウィジェット
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(
      builder: (BuildContext context, TaskStore taskStore, _) {
        return Scaffold(
          body: TaskList(),
          floatingActionButton: FloatingActionButton(
            onPressed: taskStore.addTask,
            child: Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
