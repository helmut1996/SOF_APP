import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          Center(
            child: Container(
                child: Text(
              "Control de Facturas",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
          ),
        ],
      ),
    );
  }
}
