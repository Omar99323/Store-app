import 'package:bloc/bloc.dart';
import 'package:store_app/cubits/login_cubit/login_state.dart';

class LogInCubit extends Cubit<LogInStates> {
  LogInCubit() : super(LogInInitialState());

  
}
