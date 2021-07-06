import 'dart:async';

import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/retry.dart';
import 'package:intl/intl.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_app/Presentation/pages/reloj.dart';
import 'package:sof_app/provaiders/models/modelBusquedaFactura.dart';
import 'package:sof_app/provaiders/models/modelFacturaCarpintero.dart';
import 'package:sof_app/provaiders/models/modelFacturaCosmetico.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:sof_app/provaiders/models/modelFacturaLibreria.dart';
//import 'package:http/retry.dart';

final _FacturaCosmetico = AsyncMemoizer<FacturaCosmetico>();
final _FacturaCarpintero = AsyncMemoizer<FacturaCarpintero>();
final _FacturaLibreria = AsyncMemoizer<FacturaLibreria>();
String currentsearchText = "";
final _searchTextController = TextEditingController();
StreamController<BusquedaFacturas>? streamController;
final String TipoFactura = '';

//es la clase para la conexion de la api FacturaCosmeticos
Future<FacturaCosmetico> fetchFacturaCosmetico(int pagNum) =>
    _FacturaCosmetico.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/listar_facturas_cosmeticos/" +
              pagNum.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParseFacturaCosmetico, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });

//es la clase para la conexion de la api FacturaCarpintero
Future<FacturaCarpintero> fetchFacturaCarpintero(int pagNum) =>
    _FacturaCarpintero.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/listar_facturas_carpintero/" +
              pagNum.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParseFacturaCarpintero, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });
//es la clase para la conexion de la api FacturaLibreria
Future<FacturaLibreria> fetchFacturaLibreria(int pagNum) =>
    _FacturaLibreria.runOnce(() async {
      final response = await http.get(Uri.parse(
          "https://apimarnor.garajestore.com/Apifacturas/listar_facturas_libreria/" +
              pagNum.toString() +
              "/?token=ifKZ56rMQdOKmWuDHF"));
      if (response.statusCode == 200) {
        return compute(ParseFacturaLibreria, response.body);
      } else {
        throw Exception("Failed to load.");
      }
    });
//BusquedaFacturas

Future<BusquedaFacturas> BusquedaFacturaCosmetico(String busqueda) async {
  final client = RetryClient(http.Client());
  try {
    final response = await client.read(Uri.parse(
        "https://apimarnor.garajestore.com/Apifacturas/buscar_facturas_cosmetico/" +
            busqueda +
            "/?token=ifKZ56rMQdOKmWuDHF"));

    return compute(ParsebusquedaFacturas, response);
  } finally {
    client.close();
  }
}
//BusquedaFacturasCarpintero

Future<BusquedaFacturas> BusquedaFacturaCarpintero(String busqueda) async {
  final client = RetryClient(http.Client());
  try {
    final response = await client.read(Uri.parse(
        "https://apimarnor.garajestore.com/Apifacturas/buscar_facturas_carpintero/" +
            busqueda +
            "/?token=ifKZ56rMQdOKmWuDHF"));

    return compute(ParsebusquedaFacturas, response);
  } finally {
    client.close();
  }
}

class HomePages extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat().add_jms().format(now);
  }

  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  //para la busqueda de las facturas

  //final _searchTextController = TextEditingController();
  int timestamp =
      (((new DateTime.now()).millisecondsSinceEpoch) / 1000).round();
  int last_search = 0;
  String search_status = "IDLE";
  Timer? timer;

  load() async {
    streamController = new StreamController.broadcast();
  }

  loadsearchresults() async {
    //Crear un switch
    BusquedaFacturaCosmetico(currentsearchText).then((res) async {
      streamController!.add(res);
      return res;
    });
  }

///////
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    load();
    _searchTextController.addListener(() {
      if (currentsearchText == _searchTextController.text) {
        return;
      }

      if (last_search == 0) {
        last_search = (new DateTime.now()).millisecondsSinceEpoch;
        last_search = (last_search / 1000).round();
      }

      timestamp = (new DateTime.now()).millisecondsSinceEpoch;
      timestamp = (timestamp / 1000).round();

      if (timer != null) {
        timer!.cancel();
      }

      currentsearchText = _searchTextController.text;
      setState(() {});
      if (_searchTextController.text.length > 1 &&
          (timestamp - last_search > 0)) {
        loadsearchresults();
      } else if (_searchTextController.text.length > 1 &&
          (timestamp - last_search < 1)) {
        timer = new Timer(const Duration(seconds: 1), return_timer);
      }
    });

    super.initState();
  }

  void return_timer() {
    loadsearchresults();
  }

  @override
  void dispose() {
    streamController!.close();
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsets.only(top: 50))),
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                        width: 700,
                        height: 50,
                        color: Color(0xFFd4d7dd),
                        child: PreferredSize(
                          preferredSize: new Size(700, 200),
                          child: Container(
                            height: 200,
                            color: Colors.black,
                            child: TabBar(
                              indicatorColor: Color(0xFFd4d7dd),
                              //unselectedLabelColor: Colors.,
                              tabs: <Widget>[
                                Container(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      Tab(
                                        child: Text(
                                          "Facturas\nCOSMETICOS",
                                          style: TextStyle(fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: Tab(
                                      child: Text(
                                    "PreFactura\nCOSMETICO",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: 200,
                                  child: Tab(
                                      child: Text(
                                    "FACTURA\nLIBRERIA",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: 200,
                                  child: Tab(
                                      child: Text(
                                    "Facturas\nCARPINTERO",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(padding: EdgeInsets.only(top: 50)))
              ];
            },
            body: TabBarView(
              children: <Widget>[
                _TableGenerator(type: "FacturasMarnor"),
                _TableGenerator(type: "PreFacturasMarnor"),
                _TableGenerator(type: "FacturasLibreria"),
                _TableGenerator(type: "FacturasCarpintero"),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              context.read<LoginCubit>().logOut();
            },
            child: const Icon(Icons.logout),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}

class _TableGenerator extends StatelessWidget {
  String type;

  _TableGenerator({
    required this.type,
  });
  void clickeado() {
    print("clikdeado");
  }

  @override
  Widget build(BuildContext context) {
    var facturaFuture;
    switch (type) {
      case 'FacturasMarnor':
        facturaFuture = fetchFacturaCosmetico(1);
        break;
      case 'PreFacturasMarnor':
        facturaFuture = fetchFacturaCosmetico(1);
        break;
      case 'FacturasLibreria':
        facturaFuture = fetchFacturaLibreria(1);
        break;
      case 'FacturasCarpintero':
        facturaFuture = fetchFacturaCarpintero(1);
        break;
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Reloj(),
        ),
        Container(
          padding: EdgeInsets.only(left: 350, right: 350, bottom: 20),
          child: TextField(
            controller: _searchTextController,
            onChanged: (txt) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Buscar Factura',
            ),
          ),
        ),
        Builder(
          builder: (context) {
            if (currentsearchText == "") {
              return facturasTableFuture(
                  futurewidget: facturaFuture, type: type);
            } else {
              return facturasTableSearch(type: type);
            }
          },
        ),
      ],
    );
  }
}

class facturasTableFuture extends StatelessWidget {
  final Future futurewidget;
  final String type;

  const facturasTableFuture(
      {Key? key, required this.futurewidget, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: futurewidget,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              //return _TableGenerator(type: "FacturasMarnor");
              var databody = snapshot.data.facturas;
              List<DataRow> rows = [];
              databody.forEach((factura) {
                rows.add(DataRow(cells: <DataCell>[
                  DataCell(Text(factura.idFactura.toString())),
                  DataCell(Text(factura.cliente)),
                  DataCell(Text(factura.vendedor)),
                  DataCell(Text(factura.total)),
                  DataCell(Text(factura.createdAt.date.toString())),
                  DataCell(Text(factura.tipoCompra)),
                  DataCell(
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/detallesfactura",
                                    arguments: [factura.idFactura, type]);
                              },
                              child: Icon(
                                Icons.list_alt,
                                size: 35,
                              )),
                        ],
                      ),
                    ),
                  )
                ]));
              });
              return Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                      sortColumnIndex: 0,
                      sortAscending: true,
                      columns: <DataColumn>[
                        DataColumn(
                            label: Text(
                              'No.FacturaCliente',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                            numeric: true),
                        DataColumn(
                          label: Text(
                            'Nombre Fact',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Vendedor',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Total',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Fecha',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'TipoC',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Acciones',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                      rows: rows),
                ),
              ));
            }
          }),
    );
  }
}

class facturasTableSearch extends StatelessWidget {
  final String type;

  const facturasTableSearch({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: streamController!.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var databody = snapshot.data.data;
                //print(snapshot.data.data.toString());
                List<DataRow> rows = [];
                databody.forEach((factura) {
                  rows.add(DataRow(cells: <DataCell>[
                    DataCell(Text(factura.idFactura.toString())),
                    DataCell(Text(factura.cliente)),
                    DataCell(Text(factura.vendedor)),
                    DataCell(Text(factura.total)),
                    DataCell(Text(factura.createdAt.date.toString())),
                    DataCell(Text(factura.tipoCompra)),
                    DataCell(
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/detallesfactura",
                                      arguments: [factura.idFactura, type]);
                                },
                                child: Icon(
                                  Icons.list_alt,
                                  size: 35,
                                )),
                          ],
                        ),
                      ),
                    )
                  ]));
                });
                return Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(color: Colors.white),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        sortColumnIndex: 0,
                        sortAscending: true,
                        columns: <DataColumn>[
                          DataColumn(
                              label: Text(
                                'No.FacturaCliente',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                              numeric: true),
                          DataColumn(
                            label: Text(
                              'Nombre Fact',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Vendedor',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Total',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Fecha',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'TipoC',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Acciones',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: rows),
                  ),
                ));
              } else if (snapshot.hasError) {
                return new Text("Error");
              } else {
                return Container();
              }
            })
        /*child: FutureBuilder(
          future: futurewidget,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              //return _TableGenerator(type: "FacturasMarnor");

          }),*/
        );
  }
}
