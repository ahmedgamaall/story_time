import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/extensions.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/routing/routes.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/suggestions/data/models/suggestion_response.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({super.key, required this.suggestion});

  final SuggestionResponse suggestion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.suggestionScreen, arguments: suggestion);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: ColorsManager.yellow,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: Column(
            children: [
              Text(
                suggestion.title,
                style: TextStyles.font25BlackBold,
              ),
              verticalSpace(20),
              Text(
                suggestion.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font25BlackBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
