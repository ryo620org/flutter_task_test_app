import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_test_app/auto_counter_store.dart';
import 'package:task_test_app/task_list.dart';
import 'package:task_test_app/task_store.dart';

// ページウィジェット
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 下位Widgetが状態クラスにアクセスできるように ChangeNotifierProvider を使う（複数ver）
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskStore>(create: (_) => TaskStore()),
        ChangeNotifierProvider<Clock>(create: (_) => Clock()),
      ],
      child: Consumer<TaskStore>(
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
      ),
    );
  }
}

// 一つのプロバイダーを使う場合は以下

// home: ChangeNotifierProvider<TaskStore>(
//   create: (context) => TaskStore(),
//   child: HomePage(),
// ),
