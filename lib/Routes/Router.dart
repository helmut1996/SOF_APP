import 'package:flutter/material.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/Presentation/pages/LoginPages.dart';
import 'package:sof_app/Presentation/pages/DetailsFactura.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePages());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePages());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPages());
      case '/detallesfactura':
        return MaterialPageRoute(builder: (_) => DetailsFactura());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
