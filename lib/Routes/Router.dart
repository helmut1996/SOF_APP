import 'package:flutter/material.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/Presentation/pages/LoginPages.dart';
import 'package:sof_app/Presentation/pages/DetailsFactura.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePages());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePages());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPages());
      case '/detallesfactura':
        if (arguments is int) {
          return MaterialPageRoute(
              builder: (_) => DetailsFactura(idFactura: arguments));
        } else {
          return MaterialPageRoute(builder: (_) => HomePages());
        }

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
