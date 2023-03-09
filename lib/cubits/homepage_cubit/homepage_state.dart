abstract class HomepageStates {}

class HomepageInitial extends HomepageStates {}

class HomepageLoading extends HomepageStates {}

class HomepageSuccess extends HomepageStates {}

class HomepageError extends HomepageStates {
  final String error;

  HomepageError({required this.error});
}

class HomepageNavBarState extends HomepageStates {}
