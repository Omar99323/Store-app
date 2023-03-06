import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/cubits/register_cubit/register_state.dart';
import 'package:store_app/models/register_model.dart';
import '../../helpers/api.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitial());

  bool isPass = true;
  IconData visablity = Icons.visibility;

  void changePasswordVisability() {
    isPass = !isPass;
    visablity = isPass ? Icons.visibility : Icons.visibility_off;
    emit(RegisterPasswodState());
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    Api().post(
      url: 'register',
      body: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone
      },
    ).then((value) {
      RegisterResponseModel registerData =
          RegisterResponseModel.fromjson(value);
      if (registerData.status == true) {
        emit(RegisterSuccessState(registerData.message));
      } else {
        emit(RegisterErrorState(registerData.message));
      }
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }
}
