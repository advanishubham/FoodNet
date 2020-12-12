import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Net',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange, accentColor: Colors.red),
      home: HomePage(),
    );
  }
}
