import 'package:flutter/material.dart';
import 'package:sof_app/Presentation/pages/FacturasCosmeticoPages.dart';
import 'package:sof_app/Presentation/pages/FacturasFerreteriaPages.dart';
import 'package:sof_app/Presentation/pages/FacturasLibrerias.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/Presentation/pages/PreFacturasCosmeticosPages.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePages());

      case '/facturasCosmeticos':
        return MaterialPageRoute(builder: (_) => FacturaFerreteriaPages());

      case '/Prefacturas':
        return MaterialPageRoute(builder: (_) => PreFacturasCosmeticoPages());

      case '/FacturasFerreteria':
        return MaterialPageRoute(builder: (_) => FacturaCosmeticoPages());

      case '/FacturasLibreria':
        return MaterialPageRoute(builder: (_) => FacturaLibreriaPages());

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
