import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sof_app/Presentation/pages/HomePages.dart';
import 'package:sof_app/Business_Logic/Cubit/login_cubit.dart';
import 'package:sof_app/Presentation/pages/LoginPages.dart';

import 'Business_Logic/Constants/enums.dart';
import 'Routes/Router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    var firstPage;
    var fnFirstPage;
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(create: (context) => LoginCubit())
        ],
        child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, _loginState) {
          print(_loginState);
          if (_loginState is LoggedInApp &&
              _loginState.isLogged == LoggedIn.True) {
            _navigator.currentState!.pushNamedAndRemoveUntil('/homepage',
                (Route route) => route.settings.name == 'homepage');
          } else if (_loginState.isLogged == LoggedIn.True) {
            firstPage = '/';
            fnFirstPage = HomePages();
          } else if (_loginState is LoggedOutApp) {
            firstPage = '/login';
            fnFirstPage = LoginPages();
            _navigator.currentState!.pushNamedAndRemoveUntil(
                '/login', (Route route) => route.settings.name == 'login');
          } else {
            firstPage = '/login';
            fnFirstPage = LoginPages();
          }
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Facturación',
              navigatorKey: _navigator,
              onGenerateRoute: Routes.generateRoute,
              home: fnFirstPage,
              initialRoute: firstPage);
        }));
  }
}
