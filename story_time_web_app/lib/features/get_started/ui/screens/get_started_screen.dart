import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/helpers/extensions.dart';
import 'package:stories_web_app/core/helpers/spacing.dart';
import 'package:stories_web_app/core/routing/routes.dart';
import 'package:stories_web_app/core/theming/colors.dart';
import 'package:stories_web_app/core/theming/styles.dart';
import 'package:stories_web_app/core/widgets/app_text_button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 700.h,
              // width: 80.w,
            ),
            verticalSpace(40),
            Text(
              'Entertaining stories for imaginative times',
              style: TextStyles.font25WhiteRegular,
            ),
            verticalSpace(40),
            AppTextButton(
              buttonText: 'Get Started',
              buttonWidth: 400,
              backgroundColor: ColorsManager.yellow,
              textStyle: TextStyles.font25BlackBold,
              onPressed: () => context.pushNamedAndRemoveUntil(
                Routes.allStoriesScreen,
                predicate: (route) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
