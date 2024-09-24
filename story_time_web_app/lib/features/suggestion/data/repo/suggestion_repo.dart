import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:stories_web_app/core/networking/firebase.dart';
import 'package:stories_web_app/features/suggestion/data/models/suggestion_request_body.dart';

class SuggestionRepo {
  final FirebaseNetwork _firebaseNetwork;

  SuggestionRepo(this._firebaseNetwork);

  Future<Either<String, bool>> sendSuggestion(
      SuggestionRequestBody suggestion) async {
    try {
      await _firebaseNetwork.sendSuggestion(suggestion);
      return right(true);
    } on firebase_core.FirebaseException catch (e) {
      return left(e.message ?? 'The suggestion not sended');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
