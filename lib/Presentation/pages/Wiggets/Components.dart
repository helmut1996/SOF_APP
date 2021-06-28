import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sof_app/provaiders/models/modelDetalleFactura.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

final _DetalleFacturaCosmetico = AsyncMemoizer<DetalleFacturaCosmeticos>();

//es la clase para la conexion de la api FacturaCosmeticos
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaCosmetico() =>
    _DetalleFacturaCosmetico.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/info_factura_cosmetico/50517/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParsedetalleFacturaCosmeticos, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });

class Textos extends StatefulWidget {
  @override
  _TextosState createState() => _TextosState();
}

class _TextosState extends State<Textos> {
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
