import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    this.onTap,
    required this.selected,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final bool selected;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: selected ? ColorsManager.yellow : null,
        padding: EdgeInsets.all(20.h),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? ColorsManager.darkBlue : ColorsManager.yellow,
            ),
            horizontalSpace(20),
            Text(
              title,
              style: selected
                  ? TextStyles.font25DarkBlueBold
                  : TextStyles.font25LightYellow,
            ),
          ],
        ),
      ),
    );
  }
}
