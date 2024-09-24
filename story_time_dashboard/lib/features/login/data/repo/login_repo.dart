import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stories_admin_dashboard/core/networking/firebase.dart';
import 'package:stories_admin_dashboard/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final FirebaseNetwork _firebaseNetwork;

  LoginRepo(this._firebaseNetwork);

  Future<Either<String, UserCredential>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      UserCredential credential =
          await _firebaseNetwork.login(loginRequestBody);
      return right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left('No user found for that email.');
      } else  if (e.code == 'wrong-password') {
        return left('Wrong password provided for that user.');
      } else {
        return left(e.message ?? 'Check your internet connation');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
