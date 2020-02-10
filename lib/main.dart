import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'task_store.dart';

void main() => runApp(CounterApp());

// app
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
