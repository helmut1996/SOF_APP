import 'package:flutter/material.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facturación',
        home: HomePages());
  }
}
