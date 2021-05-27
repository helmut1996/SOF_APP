import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:sof_app/src/pages/FacturasPages.dart';
import 'package:sof_app/src/pages/PreFacturasPages.dart';
import 'package:sof_app/src/pages/ProductoPages.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final List<ScreenHiddenDrawer> itemList = [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "Facturas",
        colorLineSelected: Colors.white,
        baseStyle:
            TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
        selectedStyle: TextStyle(color: Colors.black54),
      ),
      FacturasPages(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "PreFacturas",
        colorLineSelected: Colors.white,
        baseStyle:
            TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
        selectedStyle: TextStyle(color: Colors.black54),
        onTap: () {
          print("Click item");
        },
      ),
      PreFacturasPages(),
    ),
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: "Productos",
        colorLineSelected: Colors.white,
        baseStyle:
            TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 25.0),
        selectedStyle: TextStyle(color: Colors.black54),
        onTap: () {
          print("Click item");
        },
      ),
      ProductoPages(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.pinkAccent,
      backgroundColorAppBar: Colors.pinkAccent,
      screens: itemList,
          //typeOpen: TypeOpen.FROM_RIGHT,
        //  disableAppBarDefault: true,
      //    enableScaleAnimin: true,
      //    enableCornerAnimin: true,
         slidePercent: 50.0,
          verticalScalePercent: 95.0,
      contentCornerRadius: 20.0,
    // iconMenuAppBar: Icon(Icons.menu),
      //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
      //    whithAutoTittleName: true,
    //    styleAutoTittleName: TextStyle(color: Colors.red),
      //    actionsAppBar: <Widget>[],
      //    backgroundColorContent: Colors.blue,
      //    elevationAppBar: 5.0,
      tittleAppBar: Center(
        
          //child: Icon(Icons.ac_unit),
          ),
      //    enableShadowItensMenu: true,
      backgroundMenu: DecorationImage(
          image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/prueba2-8bf0c.appspot.com/o/logoushas.jpg?alt=media&token=1ff0bc30-1ab8-47b0-9e3f-a770b95e3e9f'),
          fit: BoxFit.fill),
    );
  }
}
