import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/features/login/data/models/login_request_body.dart';
import 'package:stories_admin_dashboard/features/login/data/repo/login_repo.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscureText = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void changeObscureText() {
    isObscureText = !isObscureText;
    emit(ChangeObscureTextState());
  }

  void emitLoginState() async {
    print('login');
    emit(LoadingLogin());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (errorMessage) {
        emit(FailureLogin(errorMessage));
      },
      (user) {
        emit(SuccessLogin());
      },
    );
  }
}
