import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/add_story/data/models/story_request_body.dart';

class EditStroyRepo {
  final FirebaseNetwork _firebaseNetwork;

  EditStroyRepo(this._firebaseNetwork);

  Future<Either<String, String>> uploadCover(Uint8List cover) async {
    try {
      String coverUrl = await _firebaseNetwork.uploadCover(cover);
      return right(coverUrl);
    } on firebase_core.FirebaseException catch (e) {
      return left(e.message ?? 'The cover not uploaded');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }

  Future<Either<String, bool>> edit(StoryRequestBody storyModel) async {
    try {
      await _firebaseNetwork.editStory(storyModel);
      return right(true);
    } on firebase_core.FirebaseException catch (e) {
      return left(e.message ?? 'The story not uploaded');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
