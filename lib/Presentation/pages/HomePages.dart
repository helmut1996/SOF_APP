import 'package:cupertino_tabbar/cupertino_tabbar.dart' as CupertinoTabBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
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
              )),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: Colors.white),
          child: DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Age',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Role',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Role',
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
      ],
    );
  }
}
