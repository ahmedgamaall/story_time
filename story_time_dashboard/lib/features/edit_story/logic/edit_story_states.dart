abstract class EditStroyStates {}

class EditStroyInitialState extends EditStroyStates {}

class LoadingEditStroy extends EditStroyStates {}

class FailureEditStroy extends EditStroyStates {
  final String errorMessage;
  FailureEditStroy(this.errorMessage);
}

class SuccessEditStroy extends EditStroyStates {}
