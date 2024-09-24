import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';

abstract class SearchStates {}

class SearchInitialState extends SearchStates {}

class LoadingSearch extends SearchStates {}

class SuccessSearch extends SearchStates {
  final List<StoryResponseBody> stories;

  SuccessSearch(this.stories);
}

class FailureSearch extends SearchStates {
  final String error;

  FailureSearch(this.error);
}
