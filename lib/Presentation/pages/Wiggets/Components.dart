import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 19;
    final double itemWidth = size.width / 2;
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Divider(),
          GridView.count(
            crossAxisCount: 2,
            physics:
                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true,
            childAspectRatio: (itemWidth / itemHeight),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nombre:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No.Factura:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Zona: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Vendedor: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Tipo Compra: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Fecha de Emision: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Total Compra: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Tasa de Cambio: ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
