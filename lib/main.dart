import 'package:flutter/material.dart';
import 'package:my_pyramid/vues/loader/loader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pyramid',
      theme: ThemeData(
        fontFamily: 'Stella',
      ),
      home: Loader(),
      debugShowCheckedModeBanner: false,
    );
  }
}
