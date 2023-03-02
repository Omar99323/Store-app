import 'package:bloc/bloc.dart';
import 'package:store_app/cubits/login_cubit/login_state.dart';
import 'package:store_app/helpers/api.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(LogInInitialState());

  void userLogin({
    required String email,
    required String password,
  }) {
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
        print(value);
        emit(LogInSuccessState());
      } else {
        print(value);
        emit(LogInErrorState(value.toString()));
      }
    }).catchError((error) {
      emit(LogInErrorState(error.toString()));
    });
  }
}
