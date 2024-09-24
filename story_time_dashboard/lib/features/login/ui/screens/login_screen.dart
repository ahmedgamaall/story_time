import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_button.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_cubit.dart';
import 'package:stories_admin_dashboard/features/login/ui/widgets/email_and_password.dart';
import 'package:stories_admin_dashboard/features/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Admin Dashboard',
            style: TextStyles.font50WhiteBold,
          ),
          verticalSpace(50),
          Card(
            color: ColorsManager.yellow.withOpacity(0.5),
            margin: EdgeInsets.symmetric(horizontal: 380.w),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.all(44.h),
              child: Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(35),
                  AppTextButton(
                    buttonText: 'Login',
                    textStyle: TextStyles.font25BoldDarkBlue,
                    onPressed: () {
                      LoginCubit cubit = context.read<LoginCubit>();
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.emitLoginState();
                      }
                    },
                  ),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
