import 'package:store_app/models/home_model.dart';

abstract class HomepageStates {}

class HomepageInitial extends HomepageStates {}

class HomepageLoading extends HomepageStates {}

class HomepageSuccess extends HomepageStates {
  final HomeModel homeModel;

  HomepageSuccess({required this.homeModel});
}

class HomepageError extends HomepageStates {
  final String error;

  HomepageError({required this.error});
}

class HomepageNavBarState extends HomepageStates {}
