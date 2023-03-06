abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final String succesMsg;

  RegisterSuccessState(this.succesMsg);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterPasswodState extends RegisterStates {}
