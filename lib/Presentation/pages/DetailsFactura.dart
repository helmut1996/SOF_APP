import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/provaiders/models/modelDetalleFactura.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:sof_app/provaiders/models/modelDetallePrefacturaCosmeticos.dart';
import 'package:sof_app/provaiders/models/modelFacturaCosmetico.dart';

//final _DetalleFacturaCosmetico = AsyncMemoizer<DetalleFacturaCosmeticos>();
final _DetalleFacturaCarpintero = AsyncMemoizer<DetalleFacturaCosmeticos>();
final _DetalleFacturaLibreria = AsyncMemoizer<DetalleFacturaCosmeticos>();

//es la clase para la conexion de la api DetalleFacturaCosmeticos
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaCosmetico(
    int idFactura) async {
  final response = await http.get(Uri.parse(
      "https://apimarnor.garajestore.com/Apifacturas/info_factura_cosmetico/" +
          idFactura.toString() +
          "/?token=ifKZ56rMQdOKmWuDHF"));
  if (response.statusCode == 200) {
    return compute(ParsedetalleFacturaCosmeticos, response.body);
  } else {
    throw Exception("Failed to load.");
  }
}

Future<DetallePreFacturaCosmeticos> fetchDetallePreFacturaCosmetico(
    int idFactura) async {
  final response = await http.get(Uri.parse(
      "https://apimarnor.garajestore.com/Apifacturas/info_prefactura_cosmetico/" +
          idFactura.toString() +
          "/?token=ifKZ56rMQdOKmWuDHF"));
  if (response.statusCode == 200) {
    return compute(ParsedetallePreFacturaCosmeticos, response.body);
  } else {
    throw Exception("Failed to load.");
  }
}

//es la clase para la conexion de la api DetalleFacturaCarpintero
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaCarpintero(
    int idFactura) async {
  final response = await http.get(Uri.parse(
      "https://apimarnor.garajestore.com/Apifacturas/info_factura_carpintero/" +
          idFactura.toString() +
          "/?token=ifKZ56rMQdOKmWuDHF"));
  if (response.statusCode == 200) {
    return compute(ParsedetalleFacturaCosmeticos, response.body);
  } else {
    throw Exception("Failed to load.");
  }
}

//es la clase para la conexion de la api DetalleFacturaLibreria
Future<DetalleFacturaCosmeticos> fetchDetalleFacturaLibreria(
    int idFactura) async {
  final response = await http.get(Uri.parse(
      "https://apimarnor.garajestore.com/Apifacturas/info_factura_libreria/" +
          idFactura.toString() +
          "/?token=ifKZ56rMQdOKmWuDHF"));
  if (response.statusCode == 200) {
    return compute(ParsedetalleFacturaCosmeticos, response.body);
  } else {
    throw Exception("Failed to load.");
  }
}

class DetailsFactura extends StatefulWidget {
  final int idFactura;
  final String type;

  DetailsFactura({required this.idFactura, required this.type});

  @override
  _DetailsFacturaState createState() => _DetailsFacturaState();
}

class _DetailsFacturaState extends State<DetailsFactura> {
  var facturaDetalleFuture;
  var URL;
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case 'FacturasMarnor':
        facturaDetalleFuture = fetchDetalleFacturaCosmetico(widget.idFactura);
        URL = "https://ferreteriaelcarpintero.com/images/productos/";
        break;
      case 'PreFacturasMarnor':
        facturaDetalleFuture =
            fetchDetallePreFacturaCosmetico(widget.idFactura);
        URL = "https://ferreteriaelcarpintero.com/images/productos/";
        break;
      case 'FacturasLibreria':
        facturaDetalleFuture = fetchDetalleFacturaLibreria(widget.idFactura);
        URL = "https://ferreteriaelcarpintero.com/imgesc/";
        break;
      case 'FacturasCarpintero':
        facturaDetalleFuture = fetchDetalleFacturaCarpintero(widget.idFactura);
        URL = "https://ferreteriaelcarpintero.com/images/carpintero/";
        break;
    }
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 19;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text("No.Factura: " + widget.idFactura.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Divider(),
                FutureBuilder(
                    future: facturaDetalleFuture,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        print(snapshot.connectionState);
                        print(snapshot);
                        var infoFactura = snapshot.data.infoFactura[0];
                        var listaProductos = snapshot.data.detalleFactura;
                        List<DataRow> rows = [];

                        listaProductos.forEach((producto) {
                          if (!producto.imagenApk.contains('.jpg')) {
                            producto.imagenApk = producto.imagenApk + ".jpg";
                          }
                          rows.add(DataRow(cells: <DataCell>[
                            DataCell(Text(producto.producto)),
                            DataCell(Text(producto.cantidad.toString())),
                            DataCell(Text(producto.UndPaquete.toString() +
                                " " +
                                producto.presentacion)),
                            DataCell(Text(
                                (producto.cantidad / producto.UndPaquete)
                                    .toStringAsFixed(2)
                                    .toString())),
                            DataCell(Text(producto.precio.toString())),
                            DataCell(Text((producto.cantidad * producto.precio)
                                .toString())),
                            DataCell(
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                        onTap: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: Center(
                                                    child: Text(
                                                        producto.producto)),
                                                content: Column(
                                                  children: [
                                                    Text("Existencia:" +
                                                        producto.stock
                                                            .toString()),
                                                    Text('UnidadMedida' +
                                                        producto.medida +
                                                        " " +
                                                        producto.presentacion),
                                                    Text("Existencia Cajones:" +
                                                        producto.Cajones
                                                            .toString()),
                                                    SizedBox(
                                                      width: 400,
                                                      /*height: 250,*/
                                                      child: CachedNetworkImage(
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: progress
                                                                .progress,
                                                          ),
                                                        ),
                                                        imageUrl: URL +
                                                            producto.imagenApk,
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image(
                                                                image: AssetImage(
                                                                    "assets/imagenes/imageplaceholder.jpg")),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'OK'),
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        child: Icon(
                                          Icons.image,
                                          size: 35,
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ]));
                        });

                        return Container(
                          child: Column(
                            children: [
                              Divider(),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: (itemWidth / itemHeight),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Nombre: " + infoFactura.nombreFactura,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "No.Factura: " +
                                          widget.idFactura.toString(),
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
                                        "Zona: " + infoFactura.zona,
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
                                        "Vendedor: " + infoFactura.vendedor,
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
                                        "Tipo Compra: " +
                                            infoFactura.tipoCompra,
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
                                        "Fecha de Emision: " +
                                            infoFactura.createdAt.date
                                                .toString(),
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
                                        "Total Compra: C\$" +
                                            infoFactura.total.toString(),
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
                                        "Tasa de Cambio: " +
                                            infoFactura.tasaDolar.toString(),
                                        /*infoFactura.tasaDolar.toString()*/
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
                                  child: DataTable(columns: const <DataColumn>[
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
                                        'Presentacion',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Cajones',
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
                                    DataColumn(
                                      label: Text(
                                        'Imagen',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ], rows: rows),
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
      ),
    );
  }
}
