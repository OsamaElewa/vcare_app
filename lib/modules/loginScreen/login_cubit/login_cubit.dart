import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vcareapp/core/end_points.dart';
import 'package:vcareapp/models/register_model.dart';

import '../../../core/dio_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);


  RegisterModel? registerModel;
  TextEditingController emailController=TextEditingController();
  void userLogin({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String password,
    required String passwordConfirmation,
  }){
    emit(LoginLoadingState());
    ///ToDo: make login function
    DioHelper.postData(url: registerEndPoint, data:{
      'name' : name,
      'email' : emailController.text,
      'phone' : phone,
      'gender' : gender,
      'password' : password,
      'password_confirmation' : passwordConfirmation,
    },
    ).then((value){
      print(value.data);
      registerModel = RegisterModel.fromJson(value.data);
      emit(LoginSuccessState(registerModel!));
      emailController.clear();
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}