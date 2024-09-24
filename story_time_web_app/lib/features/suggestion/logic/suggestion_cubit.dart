import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_web_app/features/suggestion/data/models/suggestion_request_body.dart';
import 'package:stories_web_app/features/suggestion/data/repo/suggestion_repo.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_states.dart';

class SuggestionCubit extends Cubit<SuggestionStates> {
  final SuggestionRepo _suggestionRepo;
  SuggestionCubit(this._suggestionRepo) : super(SuggestionInitialState());

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void sendSuggestion() async {
    emit(LoadingSuggestion());

    final response = await _suggestionRepo.sendSuggestion(
      SuggestionRequestBody(
        name: nameController.text,
        email: emailController.text,
        title: titleController.text,
        content: contentController.text,
      ),
    );

    response.fold(
      (failure) {
        emit(FailureSuggestion(failure));
      },
      (isDone) async {
        emit(SuccessSuggestion());
      },
    );
  }
}
