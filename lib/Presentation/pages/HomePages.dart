import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_app/Presentation/pages/reloj.dart';

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
                                  child: Tab(
                                      child: Text(
                                    "Facturas\nMARNOR",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: 200,
                                  child: Tab(
                                      child: Text(
                                    "Facturas\nNORMA",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                Container(
                                  height: 200,
                                  child: Tab(
                                      child: Text(
                                    "Prefacturas\nMARNOR",
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
                                    "Prefacturas\nNORMA",
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
                _TableGenerator(type: "FacturasNorma"),
                _TableGenerator(type: "PreFacturasMarnor"),
                _TableGenerator(type: "FacturasNorma"),
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Reloj(),
        ),
        Container(
          padding: EdgeInsets.only(left: 350, right: 350, bottom: 20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Buscar Factura',
            ),
          ),
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: Colors.white),
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
                  'Tipo Compra',
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
            rows: <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Sarah')),
                  DataCell(Text('19')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Icon(Icons.ac_unit_outlined))
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('Janine')),
                  DataCell(Text('43')),
                  DataCell(Text('Professor')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/detallesfactura");
                          },
                          child: Icon(Icons.view_list_outlined)),
                    ],
                  ))
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('prueba')),
                  DataCell(Icon(Icons.view_list_outlined))
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('William')),
                  DataCell(Text('27')),
                  DataCell(Text('Associate Professor')),
                  DataCell(Text('Student')),
                  DataCell(Text('Student')),
                  DataCell(Text('Prueba')),
                  DataCell(
                    Icon(Icons.view_list_outlined),
                  )
                ],
              ),
            ],
          ),
        )),
      ],
    );
  }
}
