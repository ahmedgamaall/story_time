import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/spacing.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_admin_dashboard/features/all_stories/ui/widgets/story_info.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required this.story});

  final StoryResponseBody story;

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
          story.title,
          style: TextStyles.font30WhiteBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: ColorsManager.darkBlue,
                  width: 2,
                ),
              ),
              child: Hero(
                tag: story.title,
                child: CachedNetworkImage(
                  imageUrl: story.cover,
                  height: double.infinity,
                  width: 600.w,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: const CircularProgressIndicator(
                      color: ColorsManager.darkBlue,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            horizontalSpace(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoryInfo(
                      title: 'Story Title :',
                      info: story.title,
                    ),
                    StoryInfo(
                      title: 'Story Section :',
                      info: story.section,
                    ),
                    Text(
                      'Story Content :',
                      style: TextStyles.font28MainDarkBlue,
                    ),
                    verticalSpace(5),
                    Text(
                      story.content,
                      style: TextStyles.font28DarkBlueRegular,
                    ),
                    verticalSpace(10),
                    Text(
                      'Story Moral :',
                      style: TextStyles.font28MainDarkBlue,
                    ),
                    verticalSpace(10),
                    Text(
                      story.moral,
                      style: TextStyles.font28DarkBlueRegular,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
