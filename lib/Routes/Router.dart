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
        if (arguments is List) {
          return MaterialPageRoute(
              builder: (_) => DetailsFactura(idFactura: arguments[0],type: arguments[1]));
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
