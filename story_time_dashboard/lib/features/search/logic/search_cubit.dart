import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/search/data/repo/search_repo.dart';
import 'package:stories_admin_dashboard/features/search/logic/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo _searchRepo;
  SearchCubit(this._searchRepo) : super(SearchInitialState());
  TextEditingController titleController = TextEditingController();

  void search() async {
    emit(LoadingSearch());

    final response = await _searchRepo.getSearch(titleController.text);

    response.fold(
      (failure) {
        emit(FailureSearch(failure));
      },
      (stories) {
        emit(SuccessSearch(stories));
      },
    );
  }
}
