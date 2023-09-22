
import 'package:vcareapp/models/register_model.dart';

abstract class LoginState{}

class LoginInitialState extends LoginState{}

class LoginLoadingState extends LoginState{}

class LoginSuccessState extends LoginState{
  final RegisterModel registerModel;
  LoginSuccessState(this.registerModel);

}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}
