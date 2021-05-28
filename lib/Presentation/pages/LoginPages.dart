import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat().add_jms().format(now);
  }

  final textPasswordController = TextEditingController();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
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
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: textPasswordController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ingrese su contraseña')),
            ),
            Container(
              width: 800,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<LoginCubit>()
                      .logIn(textPasswordController.text, context);
                },
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
