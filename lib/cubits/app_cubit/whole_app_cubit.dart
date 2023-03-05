import 'package:bloc/bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';

class WholeAppCubit extends Cubit<WholeAppStates> {
  WholeAppCubit() : super(WholeAppInitial());

  bool isdark = false;
  changeAppTheme() {
    isdark = !isdark;
    emit(WholeAppModeChange());
  }
}
