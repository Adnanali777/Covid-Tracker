import 'package:covid_tracker_2/screens/home.dart';
import 'package:covid_tracker_2/screens/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      debugShowCheckedModeBanner: false,
    );
  }
}
