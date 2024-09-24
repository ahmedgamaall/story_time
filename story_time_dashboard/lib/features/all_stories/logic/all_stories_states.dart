import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';

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

class LoadingDeleteStory extends AllStoriesStates {}

class SuccessDeleteStory extends AllStoriesStates {}

class FailureDeleteStory extends AllStoriesStates {
  final String error;

  FailureDeleteStory(this.error);
}
