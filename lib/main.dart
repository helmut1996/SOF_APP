import 'package:flutter/material.dart';
import 'package:sof_app/src/pages/HomePages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'material app',
        home: HomePages());
  }
}
