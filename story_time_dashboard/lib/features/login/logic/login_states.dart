abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeObscureTextState extends LoginStates {}

class LoadingLogin extends LoginStates {}

class FailureLogin extends LoginStates {
  final String errorMessage;
  FailureLogin(this.errorMessage);
}

class SuccessLogin extends LoginStates {}

