import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';

class StoryInfo extends StatelessWidget {
  const StoryInfo({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.font28MainDarkBlue,
            ),
            horizontalSpace(5),
            Text(
              info,
              style: TextStyles.font28DarkBlueRegular,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
