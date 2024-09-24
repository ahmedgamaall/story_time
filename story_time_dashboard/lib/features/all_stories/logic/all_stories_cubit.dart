import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/repo/all_stories_repo.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_states.dart';

class AllStoriesCubit extends Cubit<AllStoriesStates> {
  final AllStoriesRepo _allStoriesRepo;
  AllStoriesCubit(this._allStoriesRepo) : super(AllStoriesInitialState());

  void getAllStories() async {
    emit(LoadingAllStories());

    final response = await _allStoriesRepo.getAllStories();

    response.fold(
      (failure) {
        emit(FailureAllStories(failure));
      },
      (stories) {
        emit(SuccessAllStories(stories));
      },
    );
  }

  void deleteStory(String storyId) async {
    emit(LoadingDeleteStory());

    final response = await _allStoriesRepo.deleteStory(storyId);

    response.fold(
      (failure) {
        emit(FailureDeleteStory(failure));
      },
      (massage) {
        emit(SuccessDeleteStory());
      },
    );
  }
}
