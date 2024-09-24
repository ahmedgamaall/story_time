import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/helpers/spacing.dart';
import 'package:stories_web_app/core/theming/colors.dart';
import 'package:stories_web_app/core/theming/styles.dart';
import 'package:stories_web_app/core/widgets/app_text_button.dart';
import 'package:stories_web_app/core/widgets/success_dialog.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_cubit.dart';
import 'package:stories_web_app/features/suggestion/logic/suggestion_states.dart';
import 'package:stories_web_app/features/suggestion/ui/widgets/add_suggestion_form.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

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
          'Suggestion any story you want',
          style: TextStyles.font30WhiteBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          children: [
            const AddSuggestionForm(),
            verticalSpace(40),
            BlocConsumer<SuggestionCubit, SuggestionStates>(
              buildWhen: (previous, current) =>
                  current is LoadingSuggestion ||
                  current is SuccessSuggestion ||
                  current is FailureSuggestion,
              listenWhen: (previous, current) =>
                  current is SuccessSuggestion || current is FailureSuggestion,
              listener: (context, state) {
                if (state is SuccessSuggestion) {
                  successDialog(
                      context: context,
                      content: 'Your Suggestion submitted successfully');
                }
              },
              builder: (context, state) {
                if (state is LoadingSuggestion) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorsManager.darkBlue,
                  ));
                }
                return AppTextButton(
                  buttonText: 'Send',
                  buttonWidth: 400,
                  backgroundColor: ColorsManager.darkBlue,
                  textStyle: TextStyles.font25WhiteRegular,
                  onPressed: () {
                    SuggestionCubit cubit = context.read<SuggestionCubit>();
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.sendSuggestion();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
