import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_web_app/features/all_stories/logic/all_stories_states.dart';
import 'package:stories_web_app/features/all_stories/data/repo/all_stories_repo.dart';

class AllStoriesCubit extends Cubit<AllStoriesStates> {
  final AllStoriesRepo _allStoriesRepo;
  AllStoriesCubit(this._allStoriesRepo) : super(AllStoriesInitialState());
     bool isFavorite = false;
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
}
