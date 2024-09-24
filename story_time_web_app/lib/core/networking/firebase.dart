import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_web_app/features/suggestion/data/models/suggestion_request_body.dart';

/// Data Source
class FirebaseNetwork {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<StoryResponseBody>> getAllStories() async {
    List<StoryResponseBody> allStories = [];

    await _firestore.collection('stories').get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          allStories.add(
            StoryResponseBody.fromJson(
              docSnapshot.data(),
            ),
          );
        }
      },
    );
    return allStories;
  }

  Future<List<StoryResponseBody>> search(String title) async {
    List<StoryResponseBody> allStories = [];

    await _firestore.collection('stories').get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          if (docSnapshot.data()['title'].toString().contains(title)) {
            allStories.add(
              StoryResponseBody.fromJson(
                docSnapshot.data(),
              ),
            );
          }
        }
      },
    );
    return allStories;
  }

  Future sendSuggestion(SuggestionRequestBody suggestion) async {
    final suggestions = _firestore.collection('suggestions');
    await suggestions.add(suggestion.toJson());
  }
}
