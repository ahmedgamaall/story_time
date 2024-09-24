import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stories_web_app/core/helpers/extensions.dart';
import 'package:stories_web_app/core/routing/routes.dart';
import 'package:stories_web_app/core/theming/colors.dart';
import 'package:stories_web_app/core/theming/styles.dart';
import 'package:stories_web_app/features/all_stories/data/models/story_response_body.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.story});

  final StoryResponseBody story;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.storyScreen, arguments: story);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
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
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Container(
              color: ColorsManager.yellow,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Text(
                story.title,
                maxLines: 3,
                style: TextStyles.font25BlackBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
