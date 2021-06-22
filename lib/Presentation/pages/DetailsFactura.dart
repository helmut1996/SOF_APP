import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsFactura extends StatefulWidget {
  const DetailsFactura({Key? key}) : super(key: key);

  @override
  _DetailsFacturaState createState() => _DetailsFacturaState();
}

class _DetailsFacturaState extends State<DetailsFactura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Factura no. 110256"),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
