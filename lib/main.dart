import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_words/english_words.dart';

// 状態クラス
class TaskStore with ChangeNotifier {
  final List<String> taskItems = [];
  void addTask() {
    final wordPair = new WordPair.random();
    taskItems.add(wordPair.asPascalCase);
    notifyListeners();
  }
}

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 下位Widgetが状態クラスにアクセスできるように ChangeNotifierProvider を使う
      home: ChangeNotifierProvider(
        create: (context) => TaskStore(),
        child: HomePage(),
      ),
    );
  }
}

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

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskStore>(
        builder: (BuildContext context, TaskStore taskStore, _) {
      return ListView.builder(
        itemCount: taskStore.taskItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(taskStore.taskItems[index]);
        },
      );
    });
  }
}
