import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';

abstract class SuggestionsStates {}

class SuggestionInitialState extends SuggestionsStates {}

class LoadingSuggestion extends SuggestionsStates {}

class SuccessSuggestion extends SuggestionsStates {
  final List<SuggestionResponse>  suggestions;

  SuccessSuggestion( this.suggestions);
}

class FailureSuggestion extends SuggestionsStates {
  final String error;

  FailureSuggestion(this.error);
}
