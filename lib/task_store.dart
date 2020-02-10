import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// タスクリストの状態クラス
class TaskStore with ChangeNotifier {
  final List<String> taskItems = [];

  void addTask() {
    final wordPair = new WordPair.random();
    taskItems.add(wordPair.asPascalCase);
    notifyListeners();
  }

  void removeTask(int index) {
    taskItems.removeAt(index);
    notifyListeners();
  }
}