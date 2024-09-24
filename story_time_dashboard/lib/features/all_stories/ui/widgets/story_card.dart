import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_admin_dashboard/core/helpers/extensions.dart';
import 'package:stories_admin_dashboard/core/routing/routes.dart';
import 'package:stories_admin_dashboard/core/theming/colors.dart';
import 'package:stories_admin_dashboard/core/theming/styles.dart';
import 'package:stories_admin_dashboard/features/all_stories/data/models/story_response_body.dart';
import 'package:stories_admin_dashboard/features/all_stories/logic/all_stories_cubit.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.story});

  final StoryResponseBody story;

  @override
  Widget build(BuildContext context) {
    AllStoriesCubit cubit = context.read<AllStoriesCubit>();

    return InkWell(
      onTap: () {
        context.pushNamed(Routes.storyScreen, arguments: story);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Hero(
                    tag: story.title,
                    child: CachedNetworkImage(
                      imageUrl: story.cover,
                      height: 300.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: const CircularProgressIndicator(
                          color: ColorsManager.darkBlue,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Container(
                  color: ColorsManager.yellow,
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  child: Text(
                    story.title,
                    maxLines: 3,
                    style: TextStyles.font25BlackBold,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 25.h,
              right: 0,
              child: Container(
                color: ColorsManager.yellow,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: InkWell(
                  onTap: () {
                    cubit.deleteStory(story.docId);
                  },
                  child: Icon(
                    Icons.delete,
                    color: ColorsManager.darkBlue,
                    size: 25.sp,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 25.h,
              left: 0,
              child: Container(
                color: ColorsManager.yellow,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: InkWell(
                  onTap: () {
                    context.pushNamed(Routes.editStoryScreen, arguments: story);
                  },
                  child: Icon(
                    Icons.edit,
                    color: ColorsManager.darkBlue,
                    size: 25.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
