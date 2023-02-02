import 'package:bits_intro/users.dart';
import 'package:flutter/material.dart';


//TODO : The following are the things you will do in the lab.
/// 1. Try to fix the bug you will get when you run it the first time
/// 2. Populate the Users widget by the data provided in the [data.dart] file
/// 3. Try to optimize your code by reusing the code that is redundant while populating the code

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Users(),
    );
  }
}
