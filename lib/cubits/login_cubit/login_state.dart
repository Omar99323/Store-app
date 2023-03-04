abstract class LogInStates {}

class LogInInitialState extends LogInStates {}

class LogInLoadingState extends LogInStates {}

class LogInSuccessState extends LogInStates {
  final String succesMsg;

  LogInSuccessState(this.succesMsg);
}

class LogInErrorState extends LogInStates {
  final String error;

  LogInErrorState(this.error);
}

class LogInPasswodState extends LogInStates {}
