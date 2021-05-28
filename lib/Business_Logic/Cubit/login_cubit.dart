import 'package:bloc/src/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sof_app/Business_Logic/Constants/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginLoading()) {
    initialCheckIfLoggedIn();
  }

  void initialCheckIfLoggedIn() {
    emitCheckLogin(LoggedIn.False);
  }

  void logIn(String pin, BuildContext context) {
    if (pin == "4321") {
      emitCheckLogin(LoggedIn.True);
      emitLoggedIn();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: "Contraseña Incorrecta.",
        buttons: [
          DialogButton(
            child: Text(
              "Cancelar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      emitLoginError();
    }
  }

  void logOut() {
    emitCheckLogin(LoggedIn.False);
    emitLoggedOut();
  }

  void emitLoggedIn() => emit(LoggedInApp(isLogged: LoggedIn.True));

  void emitLoggedOut() => emit(LoggedOutApp(isLogged: LoggedIn.False));

  void emitLoginError() => emit(LoginError());

  void emitCheckLogin(LoggedIn _isLogged) =>
      emit(LoginChecked(isLogged: _isLogged));
}
