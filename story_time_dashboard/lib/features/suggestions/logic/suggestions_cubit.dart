import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/repo/suggestions_repo.dart';
import 'package:stories_admin_dashboard/features/suggestions/logic/suggestions_states.dart';

class SuggestionsCubit extends Cubit<SuggestionsStates> {
  final SuggestionsRepo _suggestionRepo;
  SuggestionsCubit(this._suggestionRepo) : super(SuggestionInitialState());

  void getSuggestions() async {
    emit(LoadingSuggestion());

    final response = await _suggestionRepo.getSuggestions();

    response.fold(
      (failure) {
        emit(FailureSuggestion(failure));
      },
      (suggestions) async {
        emit(SuccessSuggestion(suggestions));
      },
    );
  }
}
