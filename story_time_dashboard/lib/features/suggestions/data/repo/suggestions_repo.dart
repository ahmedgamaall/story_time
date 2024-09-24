import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';

class SuggestionsRepo {
  final FirebaseNetwork _firebaseNetwork;

  SuggestionsRepo(this._firebaseNetwork);

  Future<Either<String, List<SuggestionResponse>>> getSuggestions() async {
    try {
      List<SuggestionResponse> suggestions = await _firebaseNetwork.getSuggestions();
      return right(suggestions);
    } on firebase_core.FirebaseException catch (e) {
      return left(e.message ?? 'Their are no suggestions');
    } on Exception catch (errMessage) {
      return left(errMessage.toString());
    }
  }
}
