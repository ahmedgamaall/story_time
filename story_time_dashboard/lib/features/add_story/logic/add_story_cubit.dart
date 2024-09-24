import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/add_story/data/models/story_request_body.dart';
import 'package:stories_admin_dashboard/features/add_story/data/repo/add_story_repo.dart';

import 'add_story_states.dart';

class AddStroyCubit extends Cubit<AddStroyStates> {
  final AddStroyRepo _addStroyRepo;
  AddStroyCubit(this._addStroyRepo) : super(AddStroyInitialState());

  TextEditingController titleController = TextEditingController();
  TextEditingController moralController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Uint8List? cover;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitAddStroyState() async {
    emit(LoadingAddStroy());
    final uploadCover = await _addStroyRepo.uploadCover(cover!);

    uploadCover.fold(
      (failure) {
        emit(FailureAddStroy(failure));
      },
      (coverUrl) async {
        String uniqueDocId = DateTime.now().microsecondsSinceEpoch.toString();

        final response = await _addStroyRepo.addStory(
          StoryRequestBody(
            docId: uniqueDocId,
            title: titleController.text,
            moral: moralController.text,
            section: sectionController.text,
            content: contentController.text,
            cover: coverUrl,
          ),
        );
        response.fold((failure) {
          emit(FailureAddStroy(failure));
        }, (isAdded) {
          emit(SuccessAddStroy());
        });
      },
    );
  }
}
