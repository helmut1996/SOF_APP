import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/provaiders/models/modelDetalleFactura.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:sof_app/provaiders/models/modelFacturaCosmetico.dart';

final _DetalleFacturaCosmetico = AsyncMemoizer<DetalleFacturaCosmeticos>();
final _DetalleFacturaCarpintero = AsyncMemoizer<DetalleFacturaCosmeticos>();
final _DetalleFacturaLibreria = AsyncMemoizer<DetalleFacturaCosmeticos>();

//es la clase para la conexion de la api DetalleFacturaCosmeticos
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaCosmetico(int idFactura) =>
    _DetalleFacturaCosmetico.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/info_factura_cosmetico/" +
              idFactura.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParsedetalleFacturaCosmeticos, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });

//es la clase para la conexion de la api DetalleFacturaCarpintero
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaCarpintero(int idFactura) =>
    _DetalleFacturaCarpintero.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/info_factura_carpintero/" +
              idFactura.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParsedetalleFacturaCosmeticos, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });

//es la clase para la conexion de la api DetalleFacturaLibreria
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaLibreria(int idFactura) =>
    _DetalleFacturaLibreria.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/info_factura_libreria/" +
              idFactura.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParsedetalleFacturaCosmeticos, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });

class DetailsFactura extends StatefulWidget {
  @override
  _DetailsFacturaState createState() => _DetailsFacturaState();
}

/*class _DetailsFacturaState extends State<DetailsFactura> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 19;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("No.Factura"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Divider(),
              GridView.count(
                crossAxisCount: 2,
                physics:
                    NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                children: [
                  FutureBuilder(
                      future: fetchDetalleFacturaCosmetico(1),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container();
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nombre:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No.Factura:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Zona: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Vendedor: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Tipo Compra: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Fecha de Emision: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Total Compra: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Tasa de Cambio: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Container(
            child: Center(
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Producto',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Cantidad',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Precio',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Total',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Janine')),
                      DataCell(Text('43')),
                      DataCell(Text('Professor')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Associate Professor')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Associate Professor')),
                      DataCell(Text('Student')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/

class _DetailsFacturaState extends State<DetailsFactura> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 19;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("No.Factura"),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Divider(),
              FutureBuilder(
                  future: fetchDetalleFacturaCosmetico(1),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        child: Column(
                          children: [
                            Divider(),
                            GridView.count(
                              crossAxisCount: 2,
                              physics: NeverScrollableScrollPhysics(),
                              childAspectRatio: (itemWidth / itemHeight),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Nombre:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "No.Factura:22150",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Zona: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Vendedor: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Tipo Compra: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Fecha de Emision: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Total Compra: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Tasa de Cambio: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Center(
                                child: DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        'Producto',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Cantidad',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Precio',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Total',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ],
                                  rows: const <DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('Sarah')),
                                        DataCell(Text('19')),
                                        DataCell(Text('Student')),
                                        DataCell(Text('Student')),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('Janine')),
                                        DataCell(Text('43')),
                                        DataCell(Text('Professor')),
                                        DataCell(Text('Student')),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('William')),
                                        DataCell(Text('27')),
                                        DataCell(Text('Associate Professor')),
                                        DataCell(Text('Student')),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text('William')),
                                        DataCell(Text('27')),
                                        DataCell(Text('Associate Professor')),
                                        DataCell(Text('Student')),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
