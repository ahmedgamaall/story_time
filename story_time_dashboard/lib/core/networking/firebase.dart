import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:stories_admin_dashboard/features/add_story/data/models/story_request_body.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_admin_dashboard/features/login/data/models/login_request_body.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';

/// Data Source
class FirebaseNetwork {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Reference _storageRef = FirebaseStorage.instance.ref();

  Future<UserCredential> login(LoginRequestBody loginRequestBody) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: loginRequestBody.email,
      password: loginRequestBody.password,
    );
    return credential;
  }

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

  Future<String> uploadCover(Uint8List coverPath) async {
    String uniqueCoverName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference reference = _storageRef.child(uniqueCoverName);
    await reference.putData(
      coverPath,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    return await reference.getDownloadURL();
  }

  Future<void> addStory(StoryRequestBody story) async {
    final stories = _firestore.collection('stories');
    await stories.doc(story.docId).set(story.toJson());
  }
  
  Future<void> editStory(StoryRequestBody story) async {
    final stories = _firestore.collection('stories');
    await stories.doc(story.docId).set(story.toJson());
  }

  Future<void> deleteStory(String storyId) async {
    final stories = _firestore.collection('stories');
    await stories.doc(storyId).delete();
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

  Future<List<SuggestionResponse>> getSuggestions() async {
    List<SuggestionResponse> allSuggestions = [];

    await _firestore.collection('suggestions').get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          allSuggestions.add(
            SuggestionResponse.fromJson(
              docSnapshot.data(),
            ),
          );
        }
      },
    );
    return allSuggestions;
  }
}
