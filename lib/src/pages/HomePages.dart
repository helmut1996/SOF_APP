import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
              Center(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/imagenes/kool.jpg'))),
                ),
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imagenes/fondo.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
