import 'package:flutter/material.dart';
import 'package:pokemon_wiki/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Wiki',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        title: 'Pokemon Wikipedia',
      ),
    );
  }
}
