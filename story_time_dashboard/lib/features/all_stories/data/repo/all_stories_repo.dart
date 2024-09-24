import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';

class AllStoriesRepo {
  final FirebaseNetwork _firebaseNetwork;

  AllStoriesRepo(this._firebaseNetwork);

  Future<Either<String, List<StoryResponseBody>>> getAllStories() async {
    try {
      List<StoryResponseBody> allStories = await _firebaseNetwork.getAllStories();

      return right(allStories);
    } on FirebaseException catch (e) {
      return left(e.message ?? 'Thier is no stories');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }

  Future<Either<String, String>> deleteStory(String storyId) async {
    try {
      await _firebaseNetwork.deleteStory(storyId);

      return right('Done');
    } on FirebaseException catch (e) {
      return left(e.message ?? 'Their no story in this Id');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
