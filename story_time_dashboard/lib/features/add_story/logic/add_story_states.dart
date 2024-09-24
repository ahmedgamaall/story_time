abstract class AddStroyStates {}

class AddStroyInitialState extends AddStroyStates {}

class LoadingAddStroy extends AddStroyStates {}

class FailureAddStroy extends AddStroyStates {
  final String errorMessage;
  FailureAddStroy(this.errorMessage);
}

class SuccessAddStroy extends AddStroyStates {}
