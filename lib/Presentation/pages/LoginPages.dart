import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';
import 'package:sof_app/Presentation/pages/reloj.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
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
                  onSubmitted: (text) {
                    context
                        .read<LoginCubit>()
                        .logIn(textPasswordController.text, context);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
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
              child: Reloj(),
            )
          ],
        ),
      ),
    );
  }
}
