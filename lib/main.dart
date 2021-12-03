import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyNotePadApp());
}

class MyNotePadApp extends StatelessWidget {
  const MyNotePadApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
