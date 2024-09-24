abstract class SuggestionStates {}

class SuggestionInitialState extends SuggestionStates {}

class LoadingSuggestion extends SuggestionStates {}

class SuccessSuggestion extends SuggestionStates {}

class FailureSuggestion extends SuggestionStates {
  final String error;

  FailureSuggestion(this.error);
}
