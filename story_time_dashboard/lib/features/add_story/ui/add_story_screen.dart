import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_button.dart';
import 'package:stories_admin_dashboard/core/widgets/error_dialog.dart';
import 'package:stories_admin_dashboard/core/widgets/success_dialog.dart';
import 'package:stories_admin_dashboard/features/add_story/logic/add_story_cubit.dart';
import 'package:stories_admin_dashboard/features/add_story/logic/add_story_states.dart';
import 'package:stories_admin_dashboard/features/add_story/ui/widgets/add_story_form.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AddStoryForm(),
            verticalSpace(25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.h),
              child: BlocConsumer<AddStroyCubit, AddStroyStates>(
                listener: (context, state) {
                  if (state is SuccessAddStroy) {
                    successDialog(
                        context: context,
                        content: 'The story added successfully');
                  }
                  if (state is FailureAddStroy) {
                    errorDialog(context: context, content: state.errorMessage);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingAddStroy) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.darkBlue,
                      ),
                    );
                  }
                  return AppTextButton(
                    buttonText: 'Add Story',
                    textStyle: TextStyles.font25WhiteRegular,
                    backgroundColor: ColorsManager.darkBlue,
                    onPressed: () {
                      AddStroyCubit cubit = context.read<AddStroyCubit>();
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.emitAddStroyState();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
