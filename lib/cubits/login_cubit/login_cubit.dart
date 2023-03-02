import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/cubits/login_cubit/login_state.dart';
import 'package:store_app/helpers/api.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(LogInInitialState());

  bool isPass = true;
  IconData visablity = Icons.visibility;
  void changePasswordVisability() {
    isPass = !isPass;
    visablity = isPass ? Icons.visibility : Icons.visibility_off;
    emit(LogInPasswodState());
  }

  void userLogin({required String email, required String password}) {
    emit(LogInLoadingState());
    Api()
        .post(
            url: 'login',
            body: {
              'email': email,
              'password': password,
            },
            token: null)
        .then((value) {
      if (value['status'] == true) {
        emit(LogInSuccessState());
      } else {
        emit(LogInErrorState(value.toString()));
      }
    }).catchError((error) {
      emit(LogInErrorState(error.toString()));
    });
  }
}
