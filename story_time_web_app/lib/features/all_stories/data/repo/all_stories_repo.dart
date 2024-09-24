import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stories_web_app/core/networking/firebase.dart';
import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';

class AllStoriesRepo {
  final FirebaseNetwork _firebaseNetwork;

  AllStoriesRepo(this._firebaseNetwork);
  
  Future<Either<String, List<StoryResponseBody>>> getAllStories() async {
    try {
      List<StoryResponseBody> allStories =
          await _firebaseNetwork.getAllStories();

      return right(allStories);
    } on FirebaseException catch (e) {
      return left(e.message ?? 'Thier is no stories');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
