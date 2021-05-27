import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagenes/fondo.png'),
                ),
              ),
            ),
            Center(
              child: Positioned(
                  child: Container(
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/imagenes/kool.jpg'))),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
