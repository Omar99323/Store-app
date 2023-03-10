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
