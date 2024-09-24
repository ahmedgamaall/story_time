import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/helpers/extensions.dart';
import 'package:stories_admin_dashboard/core/routing/routes.dart';
import 'package:stories_admin_dashboard/core/widgets/error_dialog.dart';
import 'package:stories_admin_dashboard/core/widgets/loading_dialog.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_cubit.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_states.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) =>
          current is LoadingLogin ||
          current is FailureLogin ||
          current is SuccessLogin,
      listener: (context, state) {
        if (state is SuccessLogin) {
          context.pushNamedAndRemoveUntil(
            Routes.navbarScreen,
            predicate: (route) => false,
          );
        } else if (state is FailureLogin) {
          context.pop();
          return errorDialog(
            context: context,
            content: state.errorMessage,
          );
        } else {
          return loadingDialog(context: context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
