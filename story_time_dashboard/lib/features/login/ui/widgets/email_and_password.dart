import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_form_field.dart';
import 'package:stories_admin_dashboard/features/login/logic/login_cubit.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          verticalSpace(30),
          AppTextFormField(
            controller: cubit.passwordController,
            isObscureText: context.watch<LoginCubit>().isObscureText,
            suffixIcon: GestureDetector(
              onTap: () => cubit.changeObscureText(),
              child: Icon(
                cubit.isObscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorsManager.yellow,
              ),
            ),
            labelText: 'Password',
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
