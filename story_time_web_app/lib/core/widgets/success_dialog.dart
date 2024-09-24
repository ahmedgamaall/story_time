import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/helpers/extensions.dart';
import 'package:stories_web_app/core/theming/styles.dart';

void successDialog({
  required BuildContext context,
  required String content,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: Icon(
        Icons.check_box,
        color: Colors.green,
        size: 60.sp,
      ),
      content: Text(
        content,
        style: TextStyles.font25BlackBold,
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
