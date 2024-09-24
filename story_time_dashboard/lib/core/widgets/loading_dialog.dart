import 'package:flutter/material.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';

void loadingDialog({
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) => const Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorsManager.darkBlue,
        ),
      ),
    ),
  );
}
