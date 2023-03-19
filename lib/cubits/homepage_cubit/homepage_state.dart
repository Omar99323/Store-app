import 'package:store_app/models/login_model.dart';

abstract class HomepageStates {}

class HomepageInitial extends HomepageStates {}

class HomepageNavBarState extends HomepageStates {}

class HomepageLoading extends HomepageStates {}

class HomepageSuccess extends HomepageStates {}

class HomepageError extends HomepageStates {
  final String error;

  HomepageError({required this.error});
}

class GetCategoriesSuccess extends HomepageStates {}

class GetCategoriesError extends HomepageStates {
  final String error;

  GetCategoriesError({required this.error});
}

class EditFavoritesSuccess extends HomepageStates {}

class EditFavoritesError extends HomepageStates {
  final String error;

  EditFavoritesError({required this.error});
}

class GetFavoritesLoading extends HomepageStates {}

class GetFavoritesSuccess extends HomepageStates {}

class GetFavoritesError extends HomepageStates {
  final String error;

  GetFavoritesError({required this.error});
}

class GetProfileSuccess extends HomepageStates {}

class GetProfileError extends HomepageStates {
  final String error;

  GetProfileError({required this.error});
}

class UpdateProfileLoading extends HomepageStates {}

class UpdateProfileSuccess extends HomepageStates {
  LoginResponseModel model;
  UpdateProfileSuccess(this.model);
}

class UpdateProfileError extends HomepageStates {
  final String error;

  UpdateProfileError({required this.error});
}

class SearchLoading extends HomepageStates {}

class SearchSuccess extends HomepageStates {}

class SearchError extends HomepageStates {
  final String error;

  SearchError({required this.error});
}
