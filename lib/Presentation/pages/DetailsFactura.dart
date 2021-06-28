import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sof_app/Presentation/pages/Wiggets/Components.dart';

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
      body: Column(
        children: [
          Textos(),
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
}
