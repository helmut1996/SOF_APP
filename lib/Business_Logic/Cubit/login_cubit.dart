import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sof_app/Business_Logic/Constants/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginLoading()) {
    checkIfLoggedIn();
  }
}

void checkIfLoggedIn() {
  emitCheckLogin(LoggedIn.False);
}

void emitCheckLogin(LoggedIn _isLogged) =>
    emit(LoginChecked(isLogged: _isLogged));
