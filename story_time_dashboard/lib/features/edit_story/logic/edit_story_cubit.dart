import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/add_story/data/models/story_request_body.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_admin_dashboard/features/edit_story/data/repo/edit_story_repo.dart';

import 'edit_story_states.dart';

class EditStroyCubit extends Cubit<EditStroyStates> {
  final EditStroyRepo _editStroyRepo;
  EditStroyCubit(this._editStroyRepo) : super(EditStroyInitialState());

  TextEditingController titleController = TextEditingController();
  TextEditingController moralController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String docId = '';
  String storyImageUrl = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setValues(StoryResponseBody story) {
    docId = story.docId;
    titleController.text = story.title;
    moralController.text = story.moral;
    sectionController.text = story.section;
    contentController.text = story.content;
    storyImageUrl = story.cover;
  }

  Uint8List? cover;

  void emitEditStroyState() async {
    emit(LoadingEditStroy());
    if (cover != null) {
      final uploadCover = await _editStroyRepo.uploadCover(cover!);

      uploadCover.fold(
        (failure) {
          emit(FailureEditStroy(failure));
        },
        (coverUrl) async {
          final response = await _editStroyRepo.edit(
            StoryRequestBody(
              docId: docId,
              title: titleController.text,
              moral: moralController.text,
              section: sectionController.text,
              content: contentController.text,
              cover: coverUrl,
            ),
          );
          response.fold((failure) {
            emit(FailureEditStroy(failure));
          }, (isEdited) {
            emit(SuccessEditStroy());
          });
        },
      );
    } else {
      final response = await _editStroyRepo.edit(
        StoryRequestBody(
          docId: docId,
          title: titleController.text,
          moral: moralController.text,
          section: sectionController.text,
          content: contentController.text,
          cover: storyImageUrl,
        ),
      );
      response.fold((failure) {
        emit(FailureEditStroy(failure));
      }, (isEdited) {
        emit(SuccessEditStroy());
      });
    }
  }
}
