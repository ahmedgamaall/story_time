import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key, required this.suggestion});
  final SuggestionResponse suggestion;

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
          'Suggestion',
          style: TextStyles.font30WhiteBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Suggestion Title :',
                style: TextStyles.font28MainDarkBlue,
              ),
              verticalSpace(10),
              Text(
                suggestion.title,
                style: TextStyles.font28DarkBlueRegular,
              ),
              verticalSpace(25),
              Text(
                'Suggestion Content :',
                style: TextStyles.font28MainDarkBlue,
              ),
              verticalSpace(10),
              Text(
                suggestion.content.isNotEmpty ? suggestion.content : 'Their is no Content',
                style: TextStyles.font28DarkBlueRegular,
              ),
              verticalSpace(25),
              Text(
                'User Name :',
                style: TextStyles.font28MainDarkBlue,
              ),
              verticalSpace(10),
              Text(
                suggestion.name,
                style: TextStyles.font28DarkBlueRegular,
              ),
              verticalSpace(25),
              Text(
                'User Email :',
                style: TextStyles.font28MainDarkBlue,
              ),
              verticalSpace(10),
              Text(
                suggestion.email,
                style: TextStyles.font28DarkBlueRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
