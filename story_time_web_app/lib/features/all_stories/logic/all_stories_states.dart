import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';

abstract class AllStoriesStates {}

class AllStoriesInitialState extends AllStoriesStates {}

class LoadingAllStories extends AllStoriesStates {}

class SuccessAllStories extends AllStoriesStates {
  final List<StoryResponseBody> stories;

  SuccessAllStories(this.stories);
}

class FailureAllStories extends AllStoriesStates {
  final String error;

  FailureAllStories(this.error);
}
