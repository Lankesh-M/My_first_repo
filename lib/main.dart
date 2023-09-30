import 'package:flutter/material.dart';
import 'screen/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Self Care",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}