import 'package:flutter/material.dart';
import 'package:kuis_124200040/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuis 124200040',
      theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: home(),
    );
  }
}
