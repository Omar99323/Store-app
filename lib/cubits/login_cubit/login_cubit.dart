import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/cubits/login_cubit/login_state.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/helpers/cache_helper.dart';
import 'package:store_app/models/login_model.dart';

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
    Api().post(
      url: 'login',
      body: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      LoginResponseModel loginData = LoginResponseModel.fromjson(value);
      if (loginData.status == true) {
        CacheHelper.setData(key: 'token', value: loginData.data!.token)
            .then((value) {
          emit(LogInSuccessState(loginData.message));
        });
      } else {
        emit(LogInErrorState(loginData.message));
      }
    }).catchError((error) {
      emit(LogInErrorState(error.toString()));
    });
  }
}
