import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/extensions.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';

void errorDialog({
  required BuildContext context,
  required String content,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.red,
        size: 60.sp,
      ),
      content: Text(
        content,
        style: TextStyles.font20DarkBlue,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Ok',
            style: TextStyles.font20BoldDarkBlue,
          ),
        ),
      ],
    ),
  );
}
