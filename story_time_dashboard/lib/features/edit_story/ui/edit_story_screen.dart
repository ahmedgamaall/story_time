import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/core/widgets/app_text_button.dart';
import 'package:stories_admin_dashboard/core/widgets/error_dialog.dart';
import 'package:stories_admin_dashboard/core/widgets/success_dialog.dart';
import 'package:stories_admin_dashboard/features/edit_story/logic/edit_story_cubit.dart';
import 'package:stories_admin_dashboard/features/edit_story/logic/edit_story_states.dart';
import 'package:stories_admin_dashboard/features/edit_story/ui/widgets/edit_story_form.dart';

class EditStoryScreen extends StatelessWidget {
  const EditStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.gray,
      appBar: AppBar(
        backgroundColor: ColorsManager.darkBlue,
        iconTheme: IconThemeData(
          size: 30.sp,
          color: Colors.white,
        ),
        title: Text(
          'Edit Story',
          style: TextStyles.font30WhiteBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const EditStoryForm(),
              verticalSpace(25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.h),
                child: BlocConsumer<EditStroyCubit, EditStroyStates>(
                  listener: (context, state) {
                    if (state is SuccessEditStroy) {
                      successDialog(context: context, content: 'The story edited successfully');
                    }
                    if (state is FailureEditStroy) {
                      errorDialog(context: context, content: state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingEditStroy) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.darkBlue,
                        ),
                      );
                    }
                    return AppTextButton(
                      buttonText: 'Edit Story',
                      textStyle: TextStyles.font25WhiteRegular,
                      backgroundColor: ColorsManager.darkBlue,
                      onPressed: () {
                        EditStroyCubit cubit = context.read<EditStroyCubit>();
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.emitEditStroyState();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
