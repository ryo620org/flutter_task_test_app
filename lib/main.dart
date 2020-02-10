import 'package:flutter/material.dart';

import 'package:task_test_app/home_page.dart';

void main() => runApp(CounterApp());

// app
class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}
