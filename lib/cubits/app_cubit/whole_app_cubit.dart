import 'package:bloc/bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/helpers/cache_helper.dart';

class WholeAppCubit extends Cubit<WholeAppStates> {
  WholeAppCubit() : super(WholeAppInitial());

  bool isdark = false;
  bool firsttime = true;

  changeAppTheme({bool? shared}) {
    if (shared != null) {
      isdark = shared;
      emit(WholeAppModeChange());
    } else {
      isdark = !isdark;
      CacheHelper.setData(key: 'theme', value: isdark)
          .then((value) => emit(WholeAppModeChange()));
    }
  }

  notFirstTime({bool? shared}) {
    if (shared != null) {
      firsttime = shared;
      emit(WholeAppFirstScreenChange());
    } else {
      firsttime = false;
      CacheHelper.setData(key: 'firsttime', value: firsttime)
          .then((value) => emit(WholeAppFirstScreenChange()));
    }
  }
  
}
