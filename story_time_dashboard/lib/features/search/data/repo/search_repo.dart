import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';

class SearchRepo {
  final FirebaseNetwork _firebaseNetwork;

  SearchRepo(this._firebaseNetwork);

  Future<Either<String, List<StoryResponseBody>>> getSearch(
      String title) async {
    try {
      List<StoryResponseBody> searchedList =
          await _firebaseNetwork.search(title);

      return right(searchedList);
    } on FirebaseException catch (e) {
      return left(e.message ?? 'Thier is no stories');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
