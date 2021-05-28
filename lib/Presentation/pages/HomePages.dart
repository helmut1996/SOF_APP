import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class HomePages extends StatelessWidget {
  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat().add_jms().format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 80)),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Control de Facturas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 20, top: 160)),
            Container(
              width: 800,
              child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese su contraseña')),
            ),
            Container(
              width: 800,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Entrar"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.white)))),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: SingleChildScrollView(
                child: TimerBuilder.periodic(Duration(seconds: 1),
                    builder: (context) {
                  print("${getSystemTime()}");
                  return Text(
                    "${getSystemTime()}",
                    style: TextStyle(
                        color: Color(0xff2d386b),
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
